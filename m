Received: from mailer.cse.iitd.ac.in ([202.141.68.3]
	helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DH3O2-0005Ny-UB
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 12:23:23 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by desh.cse.iitd.ernet.in (8.12.8/8.12.8) with ESMTP id j2VHMHj5026566
	for <linux-mtd@lists.infradead.org>; Thu, 31 Mar 2005 22:52:17 +0530
Received: from desh.cse.iitd.ernet.in ([127.0.0.1])
	by localhost (desh.cse.iitd.ernet.in [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 22618-02-2 for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2005 22:52:16 +0530 (IST)
Received: from [10.20.50.26] (electron.kritikal.iitd.ernet.in [10.20.50.26])
	by desh.cse.iitd.ernet.in (8.12.8/8.12.8) with ESMTP id j2VHLP5f025876
	for <linux-mtd@lists.infradead.org>; Thu, 31 Mar 2005 22:51:32 +0530
Message-ID: <424C3195.50308@kritikalsolutions.com>
Date: Thu, 31 Mar 2005 22:51:25 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------000407000102090800060900"
Subject: Troubles with JFFS2 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000407000102090800060900
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I have written a keypad driver which is a memory mapped device which  
works perfectly fine when teh application and drivers are on NFS rather 
than on JFFS2 filesystem.__ I have already spent two months trying to 
debug it. But even a minimal keypad driver has trouble working together
with JFFS2. I never had any problems on NFS.
    I put my drivers and application onto JFFS2 filesystem and then 
mount that partition and run the application and it runs succesfully but 
when i try to unmount the partitioned just mounted it hangs.  I am using 
timer interrupt in my keypad driver which is running on a JFFS2 
filesystem on DataFlash on AT91RM9200DK on linux-2.4.27-vrs1 (using 
20050304 MTD snapshot)
    I think it is some bug in JFFS2, but I am not sure. Is JFFS2 really 
"production stable" ? I am hereby attaching the code of my Keypad 
Driver  and providing some overview of what the code is doing

INSMOD:
when the keypad driver is loaded into the kernel, the timer interrupt is 
initialized but it does nothing till the point the application tries to 
read from the keypad.

SCAN_KBD ( Timer Interrupt function)
After timer expiry this function is called and it checks for the flag, 
whether it should read from memory mapped device or not ( which is set 
when the application tries to read from keypad) and if its false , it 
just adds the timer again and returns. So when application reads , its 
sets the flag SCHEDULE_OR_NOT to 1 and thereafter the timer interrupt 
actually reads from a memory mapped region where keypad is sitting. Once 
it reads from the memory mapped region , it checks which key was being 
pressed and then ignores the key if the same key is pressed till certain 
timeout ( HZ/5 ).

READ:
Sets the flag SCHEDULE_OR_NOT to 1 so that timer interrupt actually 
starts reading from memory mapped location.

RMMOD:
When the driver is removed from the kernel , it sets a flag CLOSE_TIMER 
to 1 , which is checked by the timer interrupt and it never adds itself 
again if this flag is set., and then it calls del_timer just to check if 
timer is still added it will delete it. and thereby unmap the memory 
mapped region that was being used for keypad.


Narinder



--------------000407000102090800060900
Content-Type: text/x-csrc;
 name="mail_keypad.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mail_keypad.c"

#include <linux/config.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/miscdevice.h>
#include <linux/spinlock.h>
#include <linux/delay.h>
#include <linux/poll.h>
#include <asm/uaccess.h>
#include <asm/mach/map.h>
#include <asm/io.h>
#include <linux/ioport.h>
#include <asm/semaphore.h>

#include <asm/io.h>
#include <asm/uaccess.h>
#include <asm/irq.h>

#include <asm/arch/at91rm9200dk.h>
#include <asm/arch/AT91RM9200_SYS.h>
#include <asm/arch/AT91RM9200.h>
#include <asm/arch/hardware.h>
#include <asm/arch/pio.h>

#include <keypad.h>

static wait_queue_head_t keypad_read_queue;
static struct timer_list keypad_scan_timer;
alignedWord *kpd_cookie;
struct resource *kpd_res;
spinlock_t keypad_lock;
struct semaphore keypad_open_sema;

#define SCANHZ 50 
#define SCAN_JIFF_COUNT (HZ/SCANHZ)
#define KEY_TIMEOUT (10*SCAN_JIFF_COUNT)
#define BUFFER_SIZE 256
volatile unsigned char kpd_key_buffer[BUFFER_SIZE];
volatile int keypad_buff_count,keypad_buff_top,keypad_buff_bottom;
volatile int close_timer;
volatile int schedule_or_not;

#define NO_SCAN_LINES 2
#define NO_DEC_LINES 7
#define NO_KEYS 14

#include <asm/hardware.h>
#define AT91C_KEYPAD_PHYS_BASE     	((unsigned int)0x4FFA0000)
#define AT91C_KEYPAD_SIZE          (0x4FFFFFFF - AT91C_KEYPAD_PHYS_BASE + 1)
static unsigned short kpd_key_table[NO_SCAN_LINES][NO_DEC_LINES];
static unsigned char key_map[NO_KEYS];
static int kpd_curr_cycle;

static int init_keytable(){
        int i,j;
        for (i=0;i<NO_SCAN_LINES;i++)
        {
                for (j=0;j<NO_DEC_LINES;j++)
                {
                        kpd_key_table[i][j]=i*NO_DEC_LINES+j;
                }
        }
        return 0;
}

static void init_keymap(){
        key_map[0]=6;
        key_map[1]=5;
        key_map[2]=4;
        key_map[3]=0;
        key_map[4]=1;
        key_map[5]=2;
        key_map[6]=3;
        key_map[7]=10;          //shift
        key_map[8]=12;          // F2
        key_map[9]=11;          // F1
        key_map[10]=7;
        key_map[11]=8;
        key_map[12]=9;
        key_map[13]=13;         // 
}

int init_keypad_memspace(){
        kpd_cookie=(unsigned int *)ioremap(AT91C_KEYPAD_PHYS_BASE,AT91C_KEYPAD_SIZE);
        if(!kpd_cookie) {
                printk("Unable to map the address space \n");
                return -1;
        }
	kpd_cookie+=8;
        return 0;
}

int exit_keypad_memspace(){
        DPRINTK("Exiting from exit_keypad_memspace \n");
        if(kpd_cookie) {
		kpd_cookie-=8;
                iounmap(kpd_cookie);
        } else {
                DPRINTK(KERN_ERR "region not released");
        }
        return 0;
}

static void init_keypad_port(){
        AT91_SYS->EBI_CSA|=AT91C_EBI_CS3A_SMC;
        AT91_SYS->EBI_CFGR = 0;
        AT91_SYS->EBI_SMC2_CSR[3]=0x220037b7;
}

inline unsigned int read_first_row(){
	unsigned int res=0;
	res = kpd_cookie[0] & 0x7F;
	return res;	
}

inline unsigned int read_second_row(){
	unsigned int res=0;
	res = (kpd_cookie[0]>>16) & 0x7F;
	return res;	
}

void scan_kbd(unsigned long ignore){
	static int last_key=0;
        static int kpd_timeout=0;
      	unsigned short var1=0;
        unsigned short var2=0;
        int pos=0;
        int key;
	unsigned long flags=0;
	int wake_up=0;
     
	if(close_timer){
		return;
	}

	if(!schedule_or_not){
		goto out;
	}

        kpd_timeout+=SCAN_JIFF_COUNT;
        var1=read_first_row();
        var2=read_second_row();
	if(var1){
                pos=0;
                kpd_curr_cycle=0;
                while((pos<(NO_DEC_LINES-1)) && (!((var1>>pos)&0x01))){
                        pos++;
                }
                key=key_map[kpd_key_table[kpd_curr_cycle][pos]];
		if ((last_key==key)&&(kpd_timeout<KEY_TIMEOUT))
			goto next_cycle2;
                kpd_timeout=0;
                last_key=key;
		spin_lock_irqsave(&keypad_lock,flags);
                // Put into buffer
                kpd_key_buffer[keypad_buff_top]=key;
                keypad_buff_top++;
                if (keypad_buff_top >= BUFFER_SIZE)
                        keypad_buff_top=0;

                keypad_buff_count++;
                // Since we have exceeded the buffer size 
                if (keypad_buff_count>BUFFER_SIZE){
                        keypad_buff_count=BUFFER_SIZE;
                        keypad_buff_bottom++;
                        if (keypad_buff_bottom>=BUFFER_SIZE)
                                keypad_buff_bottom=0;
                }
		spin_unlock_irqrestore(&keypad_lock,flags);
		wake_up=1;
	}
next_cycle2:
	if(var2){
                pos=0;
                kpd_curr_cycle=1;
                while((pos<(NO_DEC_LINES-1)) && (!((var2>>pos)&0x01)))
                {
                        pos++;
                }
                key=key_map[kpd_key_table[kpd_curr_cycle][pos]];
                if ((last_key==key)&&(kpd_timeout<KEY_TIMEOUT))
                        goto out;
                kpd_timeout=0;
                last_key=key;
		spin_lock_irqsave(&keypad_lock,flags);
                // Put into buffer 
                kpd_key_buffer[keypad_buff_top]=key;
                keypad_buff_top++;
                if (keypad_buff_top >= BUFFER_SIZE)
                        keypad_buff_top=0;

                keypad_buff_count++;
                // Since we have exceeded the buffer size
                if (keypad_buff_count>BUFFER_SIZE)
                {
                        keypad_buff_count=BUFFER_SIZE;
                        keypad_buff_bottom++;
                        if (keypad_buff_bottom>=BUFFER_SIZE)
                                keypad_buff_bottom=0;
                }
		spin_unlock_irqrestore(&keypad_lock,flags);
		wake_up=1;
	}
out:
       if(wake_up){
                wake_up_interruptible(&keypad_read_queue);
        }
        keypad_scan_timer.expires = jiffies + SCAN_JIFF_COUNT;
        keypad_scan_timer.data = 0;
        keypad_scan_timer.function = scan_kbd;
        add_timer(&keypad_scan_timer);
}

static void init_kbd_timer(){
        init_timer(&keypad_scan_timer);
        keypad_scan_timer.data = 0;
        keypad_scan_timer.function = scan_kbd;
        keypad_scan_timer.expires = jiffies + SCAN_JIFF_COUNT;
        add_timer(&keypad_scan_timer);
}

static void init_kbd_buffer(){
       keypad_buff_count=keypad_buff_top=keypad_buff_bottom=0;
}

static int at91rm9200_keypad_open(struct inode *inode, struct file *filp){
	
        if(down_trylock(&keypad_open_sema)){
                return -EBUSY;
        }
	DPRINTK("Keypad open getting called \n");
	schedule_or_not=1;
	init_kbd_buffer();
        init_keytable();
        init_keymap();
	return 0;
}

static ssize_t at91rm9200_keypad_read(struct file *filp,char *buffer, size_t count, loff_t *ppos){
        int i=0;
	unsigned long flags=0;
        unsigned char data[2];
	memset(data,0,2);
	schedule_or_not=1;
        while(i<count)
        {
                spin_lock_irqsave(&keypad_lock, flags);
                if (keypad_buff_count>0)
                {
                        assert(keypad_buff_bottom < BUFFER_SIZE);
                        data[0]=kpd_key_buffer[keypad_buff_bottom];
                        keypad_buff_bottom++;
                        if (keypad_buff_bottom>=BUFFER_SIZE)
                                keypad_buff_bottom=0;
                        keypad_buff_count--;
                        spin_unlock_irqrestore(&keypad_lock, flags);
                        put_user(data[0], buffer);
			printk("read %d \n",data[0]);
                        buffer++;
                        i++;
                }
                else{
                        /* Sleep */
                        spin_unlock_irqrestore(&keypad_lock, flags);
                        interruptible_sleep_on(&keypad_read_queue);
                        if (signal_pending(current)){
				schedule_or_not=0;
                                return -EINTR;
                        }
                }
        }
	schedule_or_not=0;
        return count;
}

unsigned int at91rm9200_keypad_poll(struct file *filp, poll_table *wait)
{
	unsigned int mask=0;
	unsigned long poll_flags=0;
	spin_lock_irqsave(&keypad_lock, poll_flags);
        if(!(keypad_buff_count>0))
        {
                spin_unlock_irqrestore(&keypad_lock, poll_flags);
                poll_wait(filp,&keypad_read_queue,wait);
                spin_lock_irqsave(&keypad_lock, poll_flags);
                if(!(keypad_buff_count>0))
                {
                        mask = 0;
                        goto out;
                }
        }
        mask |= POLLIN | POLLRDNORM;
out:
        spin_unlock_irqrestore(&keypad_lock, poll_flags);
	return mask;
}

static int at91rm9200_keypad_release(struct inode *inode, struct file *filp)
{
	DPRINTK("Keypad release getting called \n");
	up(&keypad_open_sema);
	return 0;
}

static int at91rm9200_keypad_ioctl(struct inode *inode,struct file *filep,
				unsigned int cmd, unsigned long arg)
{
	unsigned long flags=0;
	switch(cmd){
	case KBD_FLUSH_BUFFER:
		break;
	case KBD_SET_KEYMAP:
		break;
	case KBD_BUFFER_KEYS:
		break;
	case KBD_SCAN:
		break;
	default:
		break;
	}
	return 0;
}


static struct file_operations at91rm9200_keypad_fops = {
	owner:  THIS_MODULE,
	open:   at91rm9200_keypad_open,
	read:  at91rm9200_keypad_read,
	poll: at91rm9200_keypad_poll,
	ioctl: at91rm9200_keypad_ioctl,
	release:at91rm9200_keypad_release,
};

static int __init at91rm9200_keypad_init(void)
{
	int ret;
	init_keypad_port();
	close_timer=0;
	if(init_keypad_memspace()<0){
		return -1;
	}
	spin_lock_init(&keypad_lock);
	sema_init(&keypad_open_sema,1);
	init_waitqueue_head(&keypad_read_queue);

	init_kbd_timer();

	ret = register_chrdev(KBD_DEVICE_MAJOR,KBD_DEVICE_NAME,&at91rm9200_keypad_fops);
	if(ret < 0) {
		printk(KBD_DEVICE_NAME "can't get major number\n");
		exit_keypad_memspace();
		return ret;
	}

	DPRINTK("Keypad initialized \n");
	return 0;
}

static void __exit at91rm9200_keypad_exit(void)
{
	close_timer=1;
	mdelay(100);
	printk("del_timer returned %d \n",del_timer(&keypad_scan_timer));
	exit_keypad_memspace();
	unregister_chrdev(KBD_DEVICE_MAJOR, KBD_DEVICE_NAME);
	DPRINTK("Keypad Uninitialized \n");
}

module_init(at91rm9200_keypad_init);
module_exit(at91rm9200_keypad_exit);

--------------000407000102090800060900
Content-Type: text/x-chdr;
 name="mail_keypad.h"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mail_keypad.h"

#ifndef _KEYPAD_DRIVER_
#define _KEYPAD_DRIVER_


#include <linux/kernel.h>
#include <linux/spinlock.h>
#include <linux/module.h>


#ifdef _DEBUG_
//#define assert(x) { if (!(x)) { BUG();} }
#define DPRINTK(format, args...) \
printk( format, ##args)
#else
//#define assert(x)
#define DPRINTK(format, args...)        
#endif

#define KBD_DEVICE_NAME	"pap-kbd"
#define KBD_DEVICE_MAJOR 	241	

/** Ioctls. */
#define KBD_BUFFER_KEYS  0x0  	/**< Number of keys in buffer */
#define KBD_FLUSH_BUFFER 0x1 	/**< Flush buffer */
#define KBD_SET_KEYMAP 	 0x2   	/**< Set the keymap */
#define KBD_SCAN 	 0x03	/**< Return the key on top of the queue 
				 *  without dequeing it. 
				 */	

#define KBD_MODE_PRIMARY	0x0
#define KBD_MODE_SECONDARY	0x1
#define KBD_MODE_TERTIARY	0x2

#define SCANHZ 50 
#define SCAN_JIFF_COUNT (HZ/SCANHZ)
#define KEY_TIMEOUT (10*SCAN_JIFF_COUNT)
#define KBD_BH_DATA_SIZE	512

typedef volatile unsigned int alignedWord; 
extern alignedWord *kpd_cookie;
extern unsigned int *kbd_bh_data;
extern struct semaphore kbd_monitor_wait;
extern volatile int kbd_bh_head;
extern volatile int kbd_bh_tail;
#endif

--------------000407000102090800060900--
