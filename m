Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLi3x-0002J0-Gi
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 09:42:40 -0500
Message-ID: <44201084.3000708@intel.com>
Date: Tue, 21 Mar 2006 17:41:08 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<44200736.5010102@ru.mvista.com>
In-Reply-To: <44200736.5010102@ru.mvista.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly,

1. No. Striping itself does not kill XIP. But it's true that using XIP 
with striped volume will not give any performance increase.
2. Please note, that mtdstripe.c is a just another middle layer module 
as mtdconcat.c or mtdpart.c, for example. It can be used on top of ANY 
command set.

As it was described in original message, we have to provide correct 
thread switching process - it is NOT striping problem but more generic 
one. We have fixed it in cfi_cmdset_0001.c. And it can be fixed (CPT) or 
workarounded (Priority switching and udelay modification) for other 
command sets. CPT (Common polling thread) has also been made as turnable 
module so anyone in any command set implementation could use it.

Another important thing to be mentioned. The patch below was validated 
on 4 different Intel flash chips (including Sibley) on arm-based 
platform. It works and gives up to 85% performance increase on two 
independent chips in system.

We can't validate these changes for other command sets. But as it was 
said striping is just an MTD middle layer module and can be used on top 
of ANY command set.

Thanks for your questions,
Alexander


Vitaly Wool wrote:
> Alexander,
>
> 1. Looks like it kills XIP.
> 2. It's pretty funny that you modify only Intel/Sharp command set 
> implementation, as if the whole MTD exists only for you.
>
> Vitaly
>
> Belyakov, Alexander wrote:
>
>> Hello,
>>
>> attached diff file is a patch to be applied on MTD snapshot 20060315
>> introducing striping feature for Linux MTD. Despite striping
>> is well known feature is was not implemented in MTD for some reason.
>> We did it and ready to share with community. Hope, striping will find
>> its
>> place in Linux MTD.
>>
>>
>> 1. STRIPING
>> (new files here are drivers/mtd/mtdstripe.c and
>> include/linux/mtd/stripe.h)
>>
>> Striping is a MTD middle layer module which allows to join several MTD
>> device
>> in one by interleaving them. For example, that allows to write to
>> different
>> physical devices simultaneously significantly increasing overall volume
>> performance. It is possible in current solution to stripe NOR, Sibley
>> and NAND devices. NOR and Sibley shows up to 85% of performance
>> increase if we have just two independent chips in system.
>>
>> Striping is a MTD middle layer quite similar to concatenation except
>> concatenated volume could not show the better performance comparing with
>> basic volume.
>>
>> In the suggested solution it is possible to stripe 2, 4, 8, etc. devices
>> of the same type. Note that devices with different sizes are supported.
>>
>> If the sublayer is build as loadable kernel module (mtdstripe.ko)
>> it is possible to pass command line to the module via insmod.
>> The format for the command line is as follow:
>>
>> cmdline_parm="<stripedef>[;<stripedef>]"
>> <stripedef> := <stripename>(<interleavesize>):<subdevname>.<subdevname>
>>
>>  Example:       insmod mtdstripe.ko
>> cmddline_parm="stripe1(128):vol1.vol3;stripe2(128):vol2.vol4      
>>  Note: you should use '.' as a delimiter for subdevice names here.
>>
>> If the sub layer is statically linked into kernel it can be configured
>> from the
>> kernel command line (the same way as for mtdpart module). The format for
>> the kernel command line is as follow:
>>
>>  mtdstripe=<stripedef>[;<stripedef>]
>>  <stripedef> :=
>> <stripename>(<interleavesize>):<subdevname>,<subdevname>      
>>  Example:       mtdstripe=stripe1(128):vol1,vol3;stripe2(128):vol2,vol4
>>  
>> In case of static kernel link and kernel configuration string
>> parameters set striping is to be initialized by mphysmap module.
>>
>> Subdevices should belong to different (independent) physical flash 
>> chips in order to get  performance increase. Value "interlavelsize"
>> describes striping granularity and it is very important from performance
>> point of view. Write operation performance increase should be expected
>> only if the amount of data to be written larger than interleave size.
>> For example, if we have 512 bytes interleave size, we see no write speed
>> boost for files smaller than 512 bytes. File systems have a write buffer
>> of
>> well known size (let it be 4096 bytes). Thus it is not good idea to set
>> interleave size larger than 2048 byte if we are striping two flash chips
>> and going to use the file system on it. For NOR devices the bottom
>> border
>> for interleave size is defined by flash buffer size (64 bytes, 128
>> bytes, etc).
>> But such a small values affects read speed on striped volumes.
>> Read performance decrease on striped volume is due to large number of
>> read suboperations. Thus, if you are going to stripe N devices and
>> launch a filesystem having write buffer of size B, the better choice
>> for interleave size is IS = B / N or somewhat smaller, but not smaller
>> than single flash chip buffer size.
>>
>> Performance increase of this solution is due to simultaneous buffer
>> write
>> to flash from several threads. On the stage of striped device
>> initialization
>> several threads created by number of subdevices used. So the main parent
>> writing thread splits write operation into parts and pushes these parts
>> to
>> worker threads queues which write data to subdevices.
>>
>> In order to provide real simultaneous writes is very important to be
>> sure
>> that worker thread switches to another while device is flushing data
>> from buffer to the chip. For example, having two physical chips we
>> should
>> observe such a picture. Thread_1 takes data chunk from its queue, put it
>> into flash buffer, gives a command to write-buffer-to-flash and after
>> that
>> switches to Thread_2 which do the same thing but with data chink from
>> its
>> own queue. After that Thread_2 gave write-buffer-to-flash command it can
>> get
>> back to Thread_1 or poll his subdevice until write operation completed.
>>
>> The original MTD code has an issue with such a switching. If we have two
>> thread of the same priority, one of them will monopolize CPU until all
>> the
>> data chunks from its queue are flushed to the chip. Apparently
>> such a behavior will not gives any performance increase. Additional
>> workaround needed.
>>
>> Two possible solutions are also presented is the diff file attached.
>> First one is more workaround and deals thread priority switching. The
>> second one is a solid solution based on CFI common polling thread (CPT)
>> creation.
>>
>> 2. Priority switching
>>
>> The main idea here is to lower priority slightly of the one worker
>> thread
>> before rescheduling. That gives control to another thread providing
>> simultaneous writing. After device has completed write operation thread
>> restores its original priority.
>> Another modification here is concerned with the split udelay time
>> in small chunks. Long udelays negatively affects striping performance 
>> since udelay call is represented by loop and can not be interrupted 
>> by other thread.
>>
>>
>> 3. CPT (Common polling thread)
>> (new files here are drivers/mtd/chips/cfi_cpt.c and
>> include/linux/mtd/cfi_cpt.h)
>>
>> Common polling thread is presented as new module in kernel that is being
>> used by CFI layer. It creates single polling thread removing
>> rescheduling
>> problem. Polling for operation completed is being done in one thread
>> raising
>> semaphores in worker threads. This feature improves performance
>> of striped volumes and any operations which used two or more
>> physical chips.
>>
>> The suggested CPT solution can be turned on in kernel configuration
>> file.
>>
>> Please find the complete diff file below.
>>
>> If you have questions please ask.
>>
>> Kind Regards,
>> Alexander Belyakov
>>
>>
>>
>> diff -uNr a/drivers/mtd/chips/cfi_cmdset_0001.c
>> b/drivers/mtd/chips/cfi_cmdset_0001.c
>> --- a/drivers/mtd/chips/cfi_cmdset_0001.c    2006-03-16
>> 12:46:25.000000000 +0300
>> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c    2006-03-16
>> 12:35:51.000000000 +0300
>> @@ -36,6 +36,10 @@
>> #include <linux/mtd/compatmac.h>
>> #include <linux/mtd/cfi.h>
>>
>> +#ifdef CONFIG_MTD_CFI_CPT
>> +#include <linux/mtd/cfi_cpt.h>
>> +#endif
>> +
>> /* #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE */
>> /* #define CMDSET0001_DISABLE_WRITE_SUSPEND */
>>
>> @@ -1045,19 +1048,62 @@
>> #define xip_enable(map, chip, adr)
>> #define XIP_INVAL_CACHED_RANGE(x...)
>>
>> -#define UDELAY(map, chip, adr, usec)  \
>> -do {  \
>> -    spin_unlock(chip->mutex);  \
>> -    cfi_udelay(usec);  \
>> -    spin_lock(chip->mutex);  \
>> -} while (0)
>> +static void snd_udelay(struct map_info *map, struct flchip *chip,
>> +                unsigned long adr, int usec)
>> +{
>> +        struct cfi_private *cfi = map->fldrv_priv;
>> +        map_word status, OK;
>> +        int chunk = 10000 / HZ; /* chunk is one percent of HZ
>> resolution */
>> +        int oldnice = current->static_prio - MAX_RT_PRIO - 20;
>> +
>> +        /* If we should wait for timeout > than HZ resolution, no 
>> need +        in resched stuff due to of process sleeping */
>> +        if ( 2*usec*HZ >= 1000000) { +                
>> msleep((usec+999)/1000);
>> +                return;
>> +        } +
>> +        /* Very short time out */
>> +        if ( usec == 1 ) {
>> +                udelay(usec);
>> +                return;
>> +        }
>> +
>> +        /* If we should wait neither too small nor too long */
>> +        OK = CMD(0x80);
>> +        while ( usec > 0 )    {
>> +                spin_unlock(chip->mutex);
>> +                /* Lower down thread priority to create concurrency */
>> +                if(oldnice > -20)
>> +                        set_user_nice(current,oldnice - 1);
>> +                /* check the status to prevent useless waiting*/
>> +                status = map_read(map, adr);
>> +                if (map_word_andequal(map, status, OK, OK)) {
>> +                        /* let recover priority */
>> +                        set_user_nice(current,oldnice);
>> +                        break;
>> +                }
>> +
>> +                if (usec < chunk )
>> +                        udelay(usec);
>> +                else +                        udelay(chunk);
>> +
>> +                cond_resched();
>> +                spin_lock(chip->mutex);
>> +
>> +                /* let recover priority */
>> +                set_user_nice(current,oldnice);
>> +                usec -= chunk;
>> +        }
>> +}
>> +
>> +#define UDELAY(map, chip, adr, usec) snd_udelay(map, chip, adr, usec)
>>
>> #define INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr, adr, len, usec)  \
>> do {  \
>> -    spin_unlock(chip->mutex);  \
>>     INVALIDATE_CACHED_RANGE(map, adr, len);  \
>> -    cfi_udelay(usec);  \
>> -    spin_lock(chip->mutex);  \
>> +        UDELAY(map, chip, cmd_adr, usec); \
>> } while (0)
>>
>> #endif
>> @@ -1452,12 +1498,18 @@
>> {
>>     struct cfi_private *cfi = map->fldrv_priv;
>>     map_word status, status_OK, write_cmd, datum;
>> -    unsigned long cmd_adr, timeo;
>> +    unsigned long cmd_adr, timeo, prog_timeo;
>>     int wbufsize, z, ret=0, word_gap, words;
>>     const struct kvec *vec;
>>     unsigned long vec_seek;
>> +    int datalen = len;    /* save it for future use */
>> +
>> +#ifdef CONFIG_MTD_CFI_CPT
>> +    extern struct cpt_thread_info *cpt_info;
>> +#endif
>>
>>     wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
>> +    prog_timeo = chip->buffer_write_time * len / wbufsize;
>>     adr += chip->start;
>>     cmd_adr = adr & ~(wbufsize-1);
>>
>> @@ -1497,12 +1549,16 @@
>>     for (;;) {
>>         map_write(map, write_cmd, cmd_adr);
>>
>> +#ifndef CONFIG_MTD_CFI_CPT
>>         status = map_read(map, cmd_adr);
>>         if (map_word_andequal(map, status, status_OK,
>> status_OK))
>>             break;
>>
>>         UDELAY(map, chip, cmd_adr, 1);
>> -
>> +#else
>> +        if (!cpt_check_wait(cpt_info, chip, map, cmd_adr,
>> status_OK, 0))
>> +            break;
>> +#endif
>>         if (++z > 20) {
>>             /* Argh. Not ready for write to buffer */
>>             map_word Xstatus;
>> @@ -1572,9 +1628,11 @@
>>     map_write(map, CMD(0xd0), cmd_adr);
>>     chip->state = FL_WRITING;
>>
>> -    INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr,
>> -                adr, len,
>> -                chip->buffer_write_time);
>> +#ifndef CONFIG_MTD_CFI_CPT
>> +    INVALIDATE_CACHE_UDELAY(map, chip,
>> +                 cmd_adr, adr,
>> +                 len,
>> +                 prog_timeo );
>>
>>     timeo = jiffies + (HZ/2);
>>     z = 0;
>> @@ -1610,14 +1668,28 @@
>>         z++;
>>         UDELAY(map, chip, cmd_adr, 1);
>>     }
>> -    if (!z) {
>> +    if (!z && (datalen == wbufsize)) {
>>         chip->buffer_write_time--;
>>         if (!chip->buffer_write_time)
>>             chip->buffer_write_time = 1;
>>     }
>> -    if (z > 1)
>> +    if ((z > 1) && (datalen == wbufsize))         
>> chip->buffer_write_time++;
>>
>> +#else
>> +    INVALIDATE_CACHED_RANGE(map, adr, len);
>> +    if(cpt_check_wait(cpt_info, chip, map, cmd_adr, status_OK, 1))
>> +    {
>> +        /* buffer write timeout */
>> +        map_write(map, CMD(0x70), cmd_adr);
>> +        chip->state = FL_STATUS;
>> +        xip_enable(map, chip, cmd_adr);
>> +        printk(KERN_ERR "%s: buffer write error (status timeout)\n",
>> map->name);
>> +        ret = -EIO;
>> +        goto out;
>> +    }
>> +#endif
>> +
>>     /* Done and happy. */
>>      chip->state = FL_STATUS;
>>
>> @@ -1693,10 +1765,6 @@
>>                 return 0;
>>         }
>>
>> -        /* Be nice and reschedule with the chip in a usable
>> state for other
>> -           processes. */
>> -        cond_resched();
>> -
>>     } while (len);
>>
>>     return 0;
>> diff -uNr a/drivers/mtd/chips/cfi_cpt.c b/drivers/mtd/chips/cfi_cpt.c
>> --- a/drivers/mtd/chips/cfi_cpt.c    1970-01-01 03:00:00.000000000
>> +0300
>> +++ b/drivers/mtd/chips/cfi_cpt.c    2006-03-16 12:34:38.000000000
>> +0300
>> @@ -0,0 +1,344 @@
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +#include <linux/kernel.h>
>> +#include <linux/sched.h>
>> +#include <linux/init.h>
>> +#include <asm/io.h>
>> +#include <asm/byteorder.h>
>> +
>> +#include <linux/errno.h>
>> +#include <linux/slab.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/reboot.h>
>> +#include <linux/mtd/xip.h>
>> +#include <linux/mtd/map.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/compatmac.h>
>> +#include <linux/mtd/cfi.h>
>> +
>> +#include <linux/mtd/cfi_cpt.h>
>> +
>> +#define STATIC_PRIO_TO_NICE(a) (((a) - MAX_RT_PRIO - 20))
>> +
>> +struct cpt_thread_info *cpt_info;
>> +
>> +static void cpt_set_priority(struct cpt_thread_info* info)
>> +{
>> +    int oldnice, newnice;
>> +
>> +    struct list_head *pos, *qos;
>> +    struct cpt_chip *chip;
>> +    struct cpt_check_desc *desc;
>> +    +    newnice = oldnice = 
>> STATIC_PRIO_TO_NICE(info->thread->static_prio);
>> +
>> +    /* list all chips and check priority */
>> +    spin_lock(&info->list_lock);
>> +    list_for_each(pos, &info->list)
>> +    {
>> +        chip = list_entry(pos, struct cpt_chip, list);
>> +    spin_lock(&chip->list_lock);
>> +    list_for_each(qos, &chip->plist)
>> +    {
>> +        desc = list_entry(chip->plist.next, struct cpt_check_desc,
>> list);
>> +        newnice = (desc->task_prio < newnice) ? desc->task_prio :
>> newnice;
>> +    }
>> +    spin_unlock(&chip->list_lock);
>> +    }
>> +    spin_unlock(&info->list_lock);
>> +    +    /* new CPT priority should be less than calling thread one */
>> +    newnice = ((newnice + 1) < -20) ? -20 : (newnice + 1);
>> +    +    if(oldnice != newnice)
>> +    set_user_nice(info->thread, newnice);
>> +}
>> +
>> +static void cpt_thread(void *arg)
>> +{
>> +    struct cpt_thread_info* info = (struct cpt_thread_info*)arg;
>> +   
>> +    struct list_head *pos;
>> +    struct cpt_chip *chip;
>> +    struct cpt_check_desc *desc;
>> +    +    map_word status;
>> +
>> +    info->thread = current;
>> +    up(&info->cpt_startstop);
>> +
>> +    while(info->cpt_cont)
>> +    {
>> +    /* wait for check issue */
>> +    down(&info->cpt_wait);
>> +   
>> +    /* list all chips and check status */
>> +    spin_lock(&info->list_lock);
>> +        list_for_each(pos, &info->list)
>> +        {
>> +        chip = list_entry(pos, struct cpt_chip, list);
>> +        spin_lock(&chip->list_lock);
>> +        if(!list_empty(&chip->plist))
>> +        {
>> +        desc = list_entry(chip->plist.next, struct
>> cpt_check_desc, list);
>> +        if(!desc->timeo)
>> +            desc->timeo = jiffies + (HZ/2);
>> +       
>> +#ifndef CONFIG_MTD_XIP
>> +        if(chip->chip->state != FL_WRITING && desc->wait)
>> +        {
>> +            /* Someone's suspended the write. Do not check
>> status on this very turn */
>> +            desc->timeo = jiffies + (HZ / 2);
>> +            up(&info->cpt_wait);
>> +            continue;
>> +        }
>> +#endif
>> +       
>> +        /* check chip status.
>> +         * if OK remove item from chip queue and release
>> semaphore. */
>> +        spin_lock(chip->chip->mutex);
>> +        status = map_read(desc->map, desc->cmd_adr);
>> +        spin_unlock(chip->chip->mutex);
>> +       
>> +        if(map_word_andequal(desc->map, status, desc->status_OK,
>> desc->status_OK))
>> +        {
>> +            /* chip has status OK */
>> +            desc->success = 1;
>> +            list_del(&desc->list);
>> +            up(&desc->check_semaphore);
>> +            +            cpt_set_priority(info);
>> +        }
>> +        else if(!desc->wait)
>> +        {
>> +            /* chip is not ready */
>> +            desc->success = 0;
>> +            list_del(&desc->list);
>> +            up(&desc->check_semaphore);
>> +            +            cpt_set_priority(info);
>> +        }
>> +        else
>> +        {
>> +            /* check for timeout */
>> +            if(time_after(jiffies, desc->timeo))
>> +            {
>> +            printk(KERN_ERR "CPT: timeout (%s)\n",
>> desc->map->name);
>> +           
>> +                desc->success = 0;
>> +            list_del(&desc->list);
>> +            up(&desc->check_semaphore);
>> +            +            cpt_set_priority(info);
>> +            }
>> +            else
>> +            {
>> +            /* wait one more time */
>> +            up(&info->cpt_wait);
>> +            }
>> +        }
>> +        }
>> +        spin_unlock(&chip->list_lock);
>> +    }
>> +    spin_unlock(&info->list_lock);
>> +
>> +    cond_resched();
>> +    }
>> +    +    info->thread = NULL;
>> +    up(&info->cpt_startstop);
>> +}
>> +
>> +
>> +static int cpt_init_thread(struct cpt_thread_info* info)
>> +{
>> +    pid_t pid;
>> +    int ret = 0;
>> +   
>> +    init_MUTEX_LOCKED(&info->cpt_startstop);    /* init start/stop
>> semaphore */
>> +       
>> +    info->cpt_cont = 1;             /* set continue thread
>> flag */
>> +    init_MUTEX_LOCKED(&info->cpt_wait);        /* init "wait
>> for data" semaphore */
>> +   
>> +    INIT_LIST_HEAD(&info->list);        /* initialize operation
>> list head */
>> +    spin_lock_init(&info->list_lock);        /* init list lock */
>> +   
>> +    pid = kernel_thread((int (*)(void *))cpt_thread, info,
>> CLONE_KERNEL); /* flags (3rd arg) TBD */
>> +    if (pid < 0)
>> +    {
>> +    printk(KERN_ERR "fork failed for CFI common polling thread:
>> %d\n", -pid);
>> +    ret = pid;
>> +    }
>> +    else
>> +    {
>> +    /* wait thread started */
>> +    DEBUG(MTD_DEBUG_LEVEL1, "CPT: write thread has pid %d\n", pid);
>> +    down(&info->cpt_startstop);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +
>> +static void cpt_shutdown_thread(struct cpt_thread_info* info)
>> +{
>> +    struct list_head *pos_chip, *pos_desc, *p, *q;
>> +    struct cpt_chip *chip;
>> +    struct cpt_check_desc *desc;
>> +
>> +    if(info->thread)
>> +    {
>> +    info->cpt_cont = 0;            /* drop thread flag */
>> +    up(&info->cpt_wait);            /* let the thread
>> complete */
>> +    down(&info->cpt_startstop);        /* wait for thread
>> completion */
>> +    DEBUG(MTD_DEBUG_LEVEL1, "CPT: common polling thread has been
>> stopped\n");
>> +    }
>> +    +    /* clean queue */
>> +    spin_lock(&info->list_lock);
>> +    list_for_each_safe(pos_chip, p, &info->list)
>> +    {
>> +        chip = list_entry(pos_chip, struct cpt_chip, list);
>> +        spin_lock(&chip->list_lock);
>> +    list_for_each_safe(pos_desc, q, &chip->list)
>> +        {
>> +            desc = list_entry(pos_desc, struct cpt_check_desc, list);
>> +        +        /* remove polling request from queue */
>> +        desc->success = 0;
>> +        list_del(&desc->list);
>> +        up(&desc->check_semaphore);
>> +    }
>> +    spin_unlock(&chip->list_lock);
>> +   
>> +    /* remove chip structure from the queue and deallocate memory */
>> +    list_del(&chip->list);
>> +    kfree(chip);
>> +    }
>> +    spin_unlock(&info->list_lock);
>> +    +    DEBUG(MTD_DEBUG_LEVEL1, "CPT: common polling thread queue 
>> has been
>> cleaned\n");
>> +}
>> +
>> +
>> +/* info - CPT thread structure
>> + * chip - chip structure pointer
>> + * map - map info structure
>> + * cmd_adr - address to write cmd
>> + * status_OK - status to be checked against
>> + * wait - flag defining wait for status or just single check
>> + *  + * returns 0 - success or error otherwise
>> + */
>> +int cpt_check_wait(struct cpt_thread_info* info, struct flchip *chip,
>> struct map_info *map, +            unsigned long cmd_adr, map_word 
>> status_OK, int wait)
>> +{
>> +    struct cpt_check_desc desc;
>> +    struct list_head *pos_chip;
>> +    struct cpt_chip *chip_cpt = NULL;
>> +    int chip_found = 0;
>> +    int status = 0;
>> +    +    desc.chip = chip;
>> +    desc.map = map;
>> +    desc.cmd_adr = cmd_adr;
>> +    desc.status_OK = status_OK;
>> +    desc.timeo = 0;
>> +    desc.wait = wait;
>> +    +    /* fill task priority for that task */
>> +    desc.task_prio = STATIC_PRIO_TO_NICE(current->static_prio);
>> +    +    init_MUTEX_LOCKED(&desc.check_semaphore);
>> +    +    /* insert element to queue */
>> +    spin_lock(&info->list_lock);
>> +    list_for_each(pos_chip, &info->list)
>> +    {
>> +        chip_cpt = list_entry(pos_chip, struct cpt_chip, list);
>> +    if(chip_cpt->chip == desc.chip)
>> +    {
>> +        chip_found = 1;
>> +        break;
>> +    }
>> +    }
>> +    +    if(!chip_found)
>> +    {
>> +    /* create new chip queue */
>> +    chip_cpt = kmalloc(sizeof(struct cpt_chip), GFP_KERNEL);
>> +        if(!chip_cpt)
>> +        {
>> +        printk(KERN_ERR "CPT: memory allocation error\n");
>> +        return -ENOMEM;
>> +        }
>> +    memset(chip_cpt, 0, sizeof(struct cpt_chip));
>> +   
>> +    chip_cpt->chip = desc.chip;
>> +    INIT_LIST_HEAD(&chip_cpt->plist);
>> +    spin_lock_init(&chip_cpt->list_lock);
>> +   
>> +    /* put chip in queue */
>> +    list_add_tail(&chip_cpt->list, &info->list);
>> +    }
>> +    spin_unlock(&info->list_lock);
>> +
>> +    /* add element to existing chip queue */
>> +    spin_lock(&chip_cpt->list_lock);
>> +    list_add_tail(&desc.list, &chip_cpt->plist);
>> +    spin_unlock(&chip_cpt->list_lock);
>> +    +    /* set new CPT priority if required */
>> +    if((desc.task_prio + 1) <
>> STATIC_PRIO_TO_NICE(info->thread->static_prio))
>> +        cpt_set_priority(info);
>> +    +    /* unlock chip mutex and wait here */
>> +    spin_unlock(desc.chip->mutex);
>> +    up(&info->cpt_wait);        /* let CPT continue */
>> +    down(&desc.check_semaphore);    /* wait until CPT rise semaphore
>> */
>> +    spin_lock(desc.chip->mutex);
>> +    +    status = desc.success ? 0 : -EIO;
>> +
>> +    return status;
>> +}
>> +
>> +static int __init cfi_cpt_init(void)
>> +{
>> +    int err;
>> +    +    cpt_info = (struct cpt_thread_info*)kmalloc(sizeof(struct
>> cpt_thread_info), GFP_KERNEL);
>> +    if (!cpt_info)
>> +    {
>> +    printk(KERN_ERR "CPT: memory allocation error\n");
>> +    return -ENOMEM;
>> +    }
>> +    +    err = cpt_init_thread(cpt_info);
>> +    if(err)
>> +    {
>> +    kfree(cpt_info);
>> +    cpt_info = NULL;
>> +    }
>> +    +    return err;
>> +}
>> +
>> +static void __exit cfi_cpt_exit(void)
>> +{
>> +    if(cpt_info)
>> +    {
>> +    cpt_shutdown_thread(cpt_info);
>> +    kfree(cpt_info);
>> +    }
>> +}
>> +
>> +EXPORT_SYMBOL(cpt_check_wait);
>> +
>> +module_init(cfi_cpt_init);
>> +module_exit(cfi_cpt_exit);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Alexander Belyakov <alexander.belyakov@intel.com>, Intel
>> Corporation");
>> +MODULE_DESCRIPTION("CFI Common Polling Thread");
>> diff -uNr a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
>> --- a/drivers/mtd/chips/Kconfig    2006-03-16 12:46:25.000000000 +0300
>> +++ b/drivers/mtd/chips/Kconfig    2006-03-16 12:34:38.000000000 +0300
>> @@ -190,6 +190,13 @@
>>       provides support for one of those command sets, used on Intel
>>       StrataFlash and other parts.
>>
>> +config MTD_CFI_CPT
>> +    bool "Common polling thread"
>> +    depends on MTD_CFI_INTELEXT
>> +    default n
>> +    help
>> +      Common polling thread for CFI
>> +
>> config MTD_CFI_AMDSTD
>>     tristate "Support for AMD/Fujitsu flash chips"
>>     depends on MTD_GEN_PROBE
>> diff -uNr a/drivers/mtd/chips/Makefile b/drivers/mtd/chips/Makefile
>> --- a/drivers/mtd/chips/Makefile    2006-03-05 22:07:54.000000000
>> +0300
>> +++ b/drivers/mtd/chips/Makefile    2006-03-16 12:34:38.000000000
>> +0300
>> @@ -24,3 +24,4 @@
>> obj-$(CONFIG_MTD_ROM)        += map_rom.o
>> obj-$(CONFIG_MTD_SHARP)        += sharp.o
>> obj-$(CONFIG_MTD_ABSENT)    += map_absent.o
>> +obj-$(CONFIG_MTD_CFI_CPT)    += cfi_cpt.o
>> diff -uNr a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
>> --- a/drivers/mtd/Kconfig    2006-03-05 22:07:54.000000000 +0300
>> +++ b/drivers/mtd/Kconfig    2006-03-16 12:34:38.000000000 +0300
>> @@ -36,6 +36,51 @@
>>       file system spanning multiple physical flash chips. If unsure,
>>       say 'Y'.
>>
>> +config MTD_STRIPE
>> +    tristate "MTD striping support"
>> +    depends on MTD
>> +    help
>> +      Support for stripinging several MTD devices into a single
>> +      (virtual) one. This allows you to have -for example- a JFFS(2)
>> +      file system interleaving multiple physical flash chips. If
>> unsure,
>> +      say 'Y'.
>> +
>> +      If you build mtdstripe.ko as a module it is possible to pass
>> +      command line to the module via insmod
>> +      +      The format for the command line is as follows:
>> +
>> +      cmdline_parm="<stripedef>[;<stripedef>]"
>> +      <stripedef> :=
>> <stripename>(<interleavesize>):<subdevname>.<subdevname>
>> +      +      Subdevices should belong to different physical flash chips
>> +      in order to get performance increase
>> +
>> +      Example:
>> +      +      insmod mtdstripe.ko
>> cmdline_parm="stripe1(128):vol1.vol3;stripe2(128):vol2.vol4"
>> +      +      Note: you should use '.' as a delimeter for subdevice 
>> names
>> here
>> +
>> +config MTD_CMDLINE_STRIPE
>> +    bool "Command line stripe configuration parsing"
>> +    depends on MTD_STRIPE = 'y'
>> +    ---help---
>> +      Allow generic configuration of the MTD striped volumes via the
>> kernel
>> +      command line. +
>> +      The format for the command line is as follows:
>> +
>> +      mtdstripe=<stripedef>[;<stripedef>]
>> +      <stripedef> :=
>> <stripename>(<interleavesize>):<subdevname>,<subdevname>
>> +      +      Subdevices should belong to different physical flash chips
>> +      in order to get performance increase
>> +
>> +      Example:
>> +      +      mtdstripe=stripe1(128):vol1,vol3;stripe2(128):vol2,vol4
>> +      config MTD_PARTITIONS
>>     bool "MTD partitioning support"
>>     depends on MTD
>> diff -uNr a/drivers/mtd/Makefile b/drivers/mtd/Makefile
>> --- a/drivers/mtd/Makefile    2006-03-05 22:07:54.000000000 +0300
>> +++ b/drivers/mtd/Makefile    2006-03-16 12:34:38.000000000 +0300
>> @@ -9,6 +9,7 @@
>> obj-$(CONFIG_MTD)        += $(mtd-y)
>>
>> obj-$(CONFIG_MTD_CONCAT)    += mtdconcat.o
>> +obj-$(CONFIG_MTD_STRIPE)    += mtdstripe.o
>> obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
>> obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
>> obj-$(CONFIG_MTD_AFS_PARTS)    += afs.o
>> diff -uNr a/drivers/mtd/maps/mphysmap.c b/drivers/mtd/maps/mphysmap.c
>> --- a/drivers/mtd/maps/mphysmap.c    2006-03-16 12:46:25.000000000
>> +0300
>> +++ b/drivers/mtd/maps/mphysmap.c    2006-03-16 12:34:38.000000000
>> +0300
>> @@ -12,6 +12,9 @@
>> #ifdef CONFIG_MTD_PARTITIONS
>> #include <linux/mtd/partitions.h>
>> #endif
>> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
>> +#include <linux/mtd/stripe.h>
>> +#endif
>>
>> static struct map_info mphysmap_static_maps[] = {
>> #if CONFIG_MTD_MULTI_PHYSMAP_1_WIDTH
>> @@ -155,6 +158,15 @@
>>         };
>>     };
>>     up(&map_mutex);
>> +
>> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
>> +#ifndef MODULE
>> +    if(mtd_stripe_init()) {
>> +        printk(KERN_WARNING "MTD stripe initialization from cmdline
>> has failed\n");
>> +    }
>> +#endif
>> +#endif
>> +
>>     return 0;
>> }
>>
>> @@ -162,6 +174,13 @@
>> static void __exit mphysmap_exit(void)
>> {
>>     int i;
>> +
>> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
>> +#ifndef MODULE
>> +    mtd_stripe_exit();
>> +#endif
>> +#endif
>> +
>>     down(&map_mutex);
>>     for (i=0;
>>
>> i<sizeof(mphysmap_static_maps)/sizeof(mphysmap_static_maps[0]);
>> diff -uNr a/drivers/mtd/mtdstripe.c b/drivers/mtd/mtdstripe.c
>> --- a/drivers/mtd/mtdstripe.c    1970-01-01 03:00:00.000000000 +0300
>> +++ b/drivers/mtd/mtdstripe.c    2006-03-16 12:34:38.000000000 +0300
>> @@ -0,0 +1,3542 @@
>> +/*
>> ########################################################################
>> #################################
>> + ###   This software program is available to you under a choice of one
>> of two licenses.  + ###   You may choose to be licensed under either 
>> the GNU General
>> Public License (GPL) Version 2, + ###   June 1991, available at 
>> http://www.fsf.org/copyleft/gpl.html, or
>> the Intel BSD + Patent License, + ###   the text of which follows:
>> + ###  + ###   Recipient has requested a license and Intel Corporation
>> ("Intel") is willing to grant a + ###   license for the software 
>> entitled MTD stripe middle layer (the
>> "Software") being provided by + ###   Intel Corporation.
>> + ###  + ###   The following definitions apply to this License: + 
>> ###  + ###   "Licensed Patents" means patent claims licensable by Intel
>> Corporation which are necessarily + ###   infringed by the use or 
>> sale of the Software alone or when
>> combined with the operating system + ###   referred to below. + ###   
>> "Recipient" means the party to whom Intel delivers this
>> Software.
>> + ###   "Licensee" means Recipient and those third parties that receive
>> a license to any operating system + ###   available under the GNU 
>> Public License version 2.0 or later.
>> + ###  + ###  Copyright (c) 1995-2005 Intel Corporation. All rights 
>> reserved. + ###  + ###  The license is provided to Recipient and 
>> Recipient's Licensees
>> under the following terms.  + ###  + ###  Redistribution and use in 
>> source and binary forms of the
>> Software, with or without modification, + ###  are permitted provided 
>> that the following conditions are met: + ###  Redistributions of 
>> source code of the Software may retain the
>> above copyright notice, this list + ###  of conditions and the 
>> following disclaimer. + ###  + ###  Redistributions in binary form of 
>> the Software may reproduce the
>> above copyright notice, + ###  this list of conditions and the 
>> following disclaimer in the
>> documentation and/or other materials + ###  provided with the 
>> distribution. + ###  + ###  Neither the name of Intel Corporation nor 
>> the names of its
>> contributors shall be used to endorse + ###  or promote products 
>> derived from this Software without specific
>> prior written permission.
>> + ###  + ###  Intel hereby grants Recipient and Licensees a 
>> non-exclusive,
>> worldwide, royalty-free patent licens
>> + ###  e under Licensed Patents to make, use, sell, offer to sell,
>> import and otherwise transfer the + ###  Software, if any, in source 
>> code and object code form. This
>> license shall include changes to + ###  the Software that are error 
>> corrections or other minor changes to
>> the Software that do not add + ###  functionality or features when 
>> the Software is incorporated in
>> any version of a operating system + ###  that has been distributed 
>> under the GNU General Public License
>> 2.0 or later.  This patent license + ###  shall apply to the 
>> combination of the Software and any operating
>> system licensed under the + ###  GNU Public License version 2.0 or 
>> later if, at the time Intel
>> provides the Software to Recipient, + ###  such addition of the 
>> Software to the then publicly available
>> versions of such operating system + ###  available under the GNU 
>> Public License version 2.0 or later
>> (whether in gold, beta or alpha form) + ###  causes such combination 
>> to be covered by the Licensed Patents.
>> The patent license shall not apply + ###  to any other combinations 
>> which include the Software. No hardware
>> per se is licensed hereunder. + ###   + ###  THIS SOFTWARE IS 
>> PROVIDED BY THE COPYRIGHT HOLDERS AND
>> CONTRIBUTORS "AS IS" AND ANY EXPRESS OR + ###  IMPLIED WARRANTIES, 
>> INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
>> WARRANTIES OF MERCHANTABILITY AND + ###  FITNESS FOR A PARTICULAR 
>> PURPOSE ARE DISCLAIMED. IN NO EVENT
>> SHALL INTEL OR ITS CONTRIBUTORS BE + ###  LIABLE FOR ANY DIRECT, 
>> INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
>> OR CONSEQUENTIAL DAMAGES + ###  (INCLUDING, BUT NOT LIMITED TO, 
>> PROCUREMENT OF SUBSTITUTE GOODS
>> OR SERVICES; LOSS OF USE, DATA,
>> + ###  OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
>> THEORY OF LIABILITY, WHETHER IN + ###  CONTRACT, STRICT LIABILITY, OR 
>> TORT (INCLUDING NEGLIGENCE OR
>> OTHERWISE) ARISING IN ANY WAY OUT + ###  OF THE USE OF THIS SOFTWARE, 
>> EVEN IF ADVISED OF THE POSSIBILITY
>> OF SUCH DAMAGE."
>> + ###
>> +
>> ########################################################################
>> ################################### */
>> +
>> +
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +#include <linux/kernel.h>
>> +#include <linux/string.h>
>> +#include <linux/slab.h>
>> +
>> +#include <linux/mtd/mtd.h>
>> +#ifdef STANDALONE
>> +#include "stripe.h"
>> +#else
>> +#include <linux/mtd/stripe.h>
>> +#endif
>> +
>> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
>> +#define CMDLINE_PARSER_STRIPE
>> +#else
>> +#ifdef MODULE
>> +#define CMDLINE_PARSER_STRIPE
>> +#endif
>> +#endif
>> +
>> +#ifdef MODULE
>> +static char *cmdline_parm = NULL;
>> +MODULE_PARM(cmdline_parm,"s");
>> +MODULE_PARM_DESC(cmdline_parm,"Command line parameters");
>> +#endif
>> +
>> +extern struct semaphore mtd_table_mutex;
>> +extern struct mtd_info *mtd_table[];
>> +
>> +#ifdef CMDLINE_PARSER_STRIPE
>> +static char *cmdline;
>> +static struct mtd_stripe_info info; /* mtd stripe info head */
>> +#endif
>> +
>> +/*
>> + * Striped device structure:
>> + * Subdev points to an array of pointers to struct mtd_info objects
>> + * which is allocated along with this structure
>> + *
>> + */
>> +struct mtd_stripe {
>> +    struct mtd_info mtd;
>> +    int num_subdev;
>> +    u_int32_t erasesize_lcm;
>> +    u_int32_t interleave_size;
>> +    u_int32_t *subdev_last_offset;
>> +    struct mtd_sw_thread_info *sw_threads;
>> +    struct mtd_info **subdev;
>> +};
>> +
>> +/* This structure is used for stripe_erase and stripe_lock/unlock
>> methods
>> + * and contains erase regions for striped devices
>> + */
>> +struct mtd_stripe_erase_bounds {
>> +    int need_erase;
>> +    u_int32_t addr;
>> +    u_int32_t len;
>> +};
>> +
>> +/* Write/erase thread info structure
>> + */
>> +struct mtd_sw_thread_info {
>> +    struct task_struct *thread;
>> +    struct mtd_info *subdev;    /* corresponding subdevice pointer */
>> +    int sw_thread;        /* continue operations flag */
>> +   
>> +    /* wait-for-data semaphore,
>> +     * up by stripe_write/erase (stripe_stop_write_thread),
>> +     * down by stripe_write_thread
>> +     */
>> +    struct semaphore sw_thread_wait;
>> +   
>> +    /* start/stop semaphore,
>> +     * up by stripe_write_thread,
>> +     * down by stripe_start/stop_write_thread
>> +     */
>> +    struct semaphore sw_thread_startstop;
>> +   
>> +    struct list_head list;    /* head of the operation list */
>> +    spinlock_t list_lock;    /* lock to remove race conditions
>> +                 * while adding/removing operations
>> +                 * to/from the list */
>> +};   
>> +
>> +/* Single suboperation structure
>> + */
>> +struct subop {
>> +    u_int32_t ofs;        /* offset of write/erase operation */
>> +    u_int32_t len;        /* length of the data to be
>> written/erased */
>> +    u_char *buf;        /* buffer with data to be written or
>> poiner +                 * to original erase_info structure
>> +                 * in case of erase operation */
>> +    u_char *eccbuf;        /* buffer with FS provided oob data.
>> +                 * used for stripe_write_ecc operation
>> +                 * NOTE: stripe_write_oob() still uses
>> u_char *buf member */
>> +};
>> +
>> +/* Suboperation array structure
>> + */
>> +struct subop_struct {
>> +    struct list_head list;    /* suboperation array queue */
>> +   
>> +    u_int32_t ops_num;         /* number of suboperations in the array
>> */
>> +    u_int32_t ops_num_max;    /* maximum allowed number of
>> suboperations */
>> +    struct subop *ops_array;    /* suboperations array */
>> +};
>> +
>> +/* Operation codes */
>> +#define MTD_STRIPE_OPCODE_READ        0x1
>> +#define MTD_STRIPE_OPCODE_WRITE        0x2
>> +#define MTD_STRIPE_OPCODE_READ_ECC    0x3
>> +#define MTD_STRIPE_OPCODE_WRITE_ECC    0x4
>> +#define MTD_STRIPE_OPCODE_WRITE_OOB    0x5
>> +#define MTD_STRIPE_OPCODE_ERASE        0x6
>> +
>> +/* Stripe operation structure
>> + */
>> +struct mtd_stripe_op {
>> +    struct list_head list;    /* per thread (device) queue */
>> +   
>> +    char opcode;        /* operation code */
>> +    int caller_id; /* reserved for thread ID issued this operation */
>> +    int op_prio;         /* original operation prioriry */
>> +   
>> +    struct semaphore sem;    /* operation completed semaphore */
>> +    struct subop_struct subops; /* suboperation structure */
>> +   
>> +    int status;            /* operation completed status */
>> +    u_int32_t fail_addr;    /* fail address (for erase operation) */
>> +    u_char state;        /* state (for erase operation) */
>> +};
>> +
>> +#define SIZEOF_STRUCT_MTD_STRIPE_OP(num_ops) \
>> +    ((sizeof(struct mtd_stripe_op) + (num_ops) * sizeof(struct
>> subop)))
>> +   
>> +#define SIZEOF_STRUCT_MTD_STRIPE_SUBOP(num_ops) \
>> +    ((sizeof(struct subop_struct) + (num_ops) * sizeof(struct
>> subop)))
>> +
>> +/*
>> + * how to calculate the size required for the above structure,
>> + * including the pointer array subdev points to:
>> + */
>> +#define SIZEOF_STRUCT_MTD_STRIPE(num_subdev)    \
>> +    ((sizeof(struct mtd_stripe) + (num_subdev) * sizeof(struct
>> mtd_info *) \
>> +     + (num_subdev) * sizeof(u_int32_t) \
>> +     + (num_subdev) * sizeof(struct mtd_sw_thread_info)))
>> +
>> +/*
>> + * Given a pointer to the MTD object in the mtd_stripe structure,
>> + * we can retrieve the pointer to that structure with this macro.
>> + */
>> +#define STRIPE(x)  ((struct mtd_stripe *)(x))
>> +
>> +/* Forward functions declaration
>> + */
>> +static int stripe_dev_erase(struct mtd_info *mtd, struct erase_info
>> *erase);
>> +
>> +/*
>> + * Miscelaneus support routines
>> + */
>> + +/*
>> + * searches for least common multiple of a and b
>> + * returns: LCM or 0 in case of error
>> + */
>> +u_int32_t
>> +lcm(u_int32_t a, u_int32_t b)
>> +{
>> +    u_int32_t lcm;
>> +    /* u_int32_t ab = a * b; */
>> +    u_int32_t t1 = a;
>> +    u_int32_t t2 = b;
>> +     +    if(a <= 0 || b <= 0) +    {
>> +        lcm = 0;
>> +    printk(KERN_ERR "lcm(): wrong arguments\n");
>> +    }
>> +    else
>> +    {
>> +        do
>> +        {
>> +            lcm = a;
>> +            a = b;
>> +            b = lcm - a*(lcm/a);
>> +        }
>> +        while(b!=0);
>> +   
>> +    if(t1 % a)
>> +        lcm = (t2 / a) * t1;
>> +    else
>> +        lcm = (t1 / a) * t2;
>> +    }
>> +
>> +    return lcm;
>> +} /* int lcm(int a, int b) */
>> +
>> +u_int32_t last_offset(struct mtd_stripe *stripe, int subdev_num);
>> +
>> +/*
>> + * Calculates last_offset for specific striped subdevice
>> + * NOTE: subdev array MUST be sorted
>> + * by subdevice size (from the smallest to the largest)
>> + */
>> +u_int32_t
>> +last_offset(struct mtd_stripe *stripe, int subdev_num)
>> +{
>> +    u_int32_t offset = 0;
>> +   
>> +    /* Interleave block count for previous subdevice in the array */
>> +    u_int32_t prev_dev_size_n = 0;
>> +   
>> +    /* Current subdevice interleaved block count */
>> +    u_int32_t curr_size_n = stripe->subdev[subdev_num]->size /
>> stripe->interleave_size;
>> +   
>> +    int i;
>> +   
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    struct mtd_info *subdev = stripe->subdev[i];
>> +    /* subdevice interleaved block count */
>> +    u_int32_t size_n = subdev->size / stripe->interleave_size;
>> +       
>> +    if(i < subdev_num)
>> +    {
>> +        if(size_n < curr_size_n)
>> +        {
>> +            offset += (size_n - prev_dev_size_n) *
>> (stripe->num_subdev - i);
>> +        prev_dev_size_n = size_n;
>> +        }
>> +        else
>> +        {
>> +        offset += (size_n - prev_dev_size_n - 1) *
>> (stripe->num_subdev - i) + 1;
>> +        prev_dev_size_n = size_n - 1;
>> +        }
>> +    }
>> +    else if (i == subdev_num)
>> +    {
>> +        offset += (size_n - prev_dev_size_n - 1) *
>> (stripe->num_subdev - i) + 1;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    return (offset * stripe->interleave_size);
>> +} /* u_int32_t last_offset(struct mtd_stripe *stripe, int subdev_num)
>> */
>> +
>> +/* this routine returns oobavail size based on oobfree array
>> + * since original mtd_info->oobavail field seems to be zeroed by
>> unknown reason
>> + */
>> +int stripe_get_oobavail(struct mtd_info *mtd)
>> +{
>> +    int oobavail = 0;
>> +    uint32_t oobfree_max_num = 8; /* array size defined in mtd-abi.h */
>> +    int i;
>> +    +    for(i = 0; i < oobfree_max_num; i++)
>> +    {
>> +        if(mtd->oobinfo.oobfree[i][1])
>> +        oobavail += mtd->oobinfo.oobfree[i][1];
>> +    }
>> +        +    return oobavail;
>> +}
>> +
>> +/* routine merges subdevs oobinfo into new mtd device oobinfo
>> + * this should be made after subdevices sorting done for proper eccpos
>> and oobfree positioning
>> + *
>> + * returns: 0 - success */
>> +int stripe_merge_oobinfo(struct mtd_info *mtd, struct mtd_info
>> *subdev[], int num_devs)
>> +{
>> +    int ret = 0;
>> +    int i, j;
>> +    uint32_t eccpos_max_num = sizeof(mtd->oobinfo.eccpos) /
>> sizeof(uint32_t);
>> +    uint32_t eccpos_counter = 0;
>> +    uint32_t oobfree_max_num = 8; /* array size defined in mtd-abi.h */
>> +    uint32_t oobfree_counter = 0;
>> +    +    if(mtd->type != MTD_NANDFLASH)
>> +    return 0;
>> +    +    mtd->oobinfo.useecc = subdev[0]->oobinfo.useecc;
>> +    mtd->oobinfo.eccbytes = subdev[0]->oobinfo.eccbytes;
>> +    for(i = 1; i < num_devs; i++)
>> +    {
>> +    if(mtd->oobinfo.useecc != subdev[i]->oobinfo.useecc ||
>> +        mtd->oobinfo.eccbytes != subdev[i]->oobinfo.eccbytes)
>> +    {
>> +        printk(KERN_ERR "stripe_merge_oobinfo(): oobinfo parameters
>> is not compatible for all subdevices\n");
>> +        return -EINVAL;
>> +    }
>> +    }
>> +    +    mtd->oobinfo.eccbytes *= num_devs;
>> +    +    /* drop old oobavail value */
>> +    mtd->oobavail = 0;
>> +    +    /* merge oobfree space positions */
>> +    for(i = 0; i < num_devs; i++)
>> +    {
>> +    for(j = 0; j < oobfree_max_num; j++)
>> +    {
>> +        if(subdev[i]->oobinfo.oobfree[j][1])
>> +        {
>> +        if(oobfree_counter >= oobfree_max_num)
>> +            break;
>> +
>> +        mtd->oobinfo.oobfree[oobfree_counter][0] =
>> subdev[i]->oobinfo.oobfree[j][0] +
>> +                                i *
>> subdev[i]->oobsize;
>> +        mtd->oobinfo.oobfree[oobfree_counter][1] =
>> subdev[i]->oobinfo.oobfree[j][1];
>> +                                +        mtd->oobavail += 
>> subdev[i]->oobinfo.oobfree[j][1];
>> +        oobfree_counter++;
>> +        }
>> +    }
>> +    }
>> +    +    /* merge ecc positions */
>> +    for(i = 0; i < num_devs; i++)
>> +    {
>> +    for(j = 0; j < eccpos_max_num; j++)
>> +    {
>> +        if(subdev[i]->oobinfo.eccpos[j])
>> +        {
>> +        if(eccpos_counter >= eccpos_max_num)
>> +        {
>> +            printk(KERN_ERR "stripe_merge_oobinfo(): eccpos
>> merge error\n");
>> +            return -EINVAL;
>> +        }
>> +
>> mtd->oobinfo.eccpos[eccpos_counter]=subdev[i]->oobinfo.eccpos[j] + i *
>> subdev[i]->oobsize;
>> +        eccpos_counter++;
>> +        }
>> +    }
>> +    }
>> +    +    return ret;
>> +}
>> +
>> +/* End of support routines */
>> +
>> +/* Multithreading support routines */
>> +
>> +/* Write to flash thread */
>> +static void
>> +stripe_write_thread(void *arg)
>> +{
>> +    struct mtd_sw_thread_info* info = (struct mtd_sw_thread_info*)arg;
>> +    struct mtd_stripe_op* op;
>> +    struct subop_struct* subops;
>> +    u_int32_t retsize;
>> +    int err;
>> +   
>> +    int i;
>> +    struct list_head *pos;
>> +
>> +    /* erase operation stuff */   
>> +    struct erase_info erase;    /* local copy */
>> +    struct erase_info *instr;    /* pointer to original */
>> +   
>> +    info->thread = current;
>> +    up(&info->sw_thread_startstop);
>> +
>> +    while(info->sw_thread)
>> +    {
>> +    /* wait for downcoming write/erase operation */
>> +    down(&info->sw_thread_wait);
>> +       
>> +    /* issue operation to the device and remove it from the list
>> afterwards*/
>> +    spin_lock(&info->list_lock);
>> +    if(!list_empty(&info->list))
>> +    {
>> +        op = list_entry(info->list.next,struct mtd_stripe_op, list);
>> +    }
>> +    else
>> +    {
>> +        /* no operation in queue but sw_thread_wait has been rised.
>> +         * it means stripe_stop_write_thread() has been called
>> +         */
>> +        op = NULL;
>> +    }
>> +    spin_unlock(&info->list_lock);
>> +
>> +        /* leave main thread loop if no ops */       
>> +    if(!op)
>> +        break;
>> +       
>> +    err = 0;
>> +    op->status = 0;
>> +       
>> +    switch(op->opcode)
>> +    {
>> +        case MTD_STRIPE_OPCODE_WRITE:
>> +        case MTD_STRIPE_OPCODE_WRITE_OOB:
>> +        /* proceed with list head first */
>> +        subops = &op->subops;
>> +               
>> +        for(i = 0; i < subops->ops_num; i++)
>> +        {
>> +            if(op->opcode == MTD_STRIPE_OPCODE_WRITE)
>> +                err = info->subdev->write(info->subdev,
>> subops->ops_array[i].ofs, subops->ops_array[i].len, &retsize,
>> subops->ops_array[i].buf);
>> +            else
>> +            err = info->subdev->write_oob(info->subdev,
>> subops->ops_array[i].ofs, subops->ops_array[i].len, &retsize,
>> subops->ops_array[i].buf);
>> +            +            if(err)
>> +            {
>> +            op->status = -EINVAL;
>> +            printk(KERN_ERR "mtd_stripe: write operation
>> failed %d\n",err);
>> +                break;
>> +            }
>> +        }
>> +               
>> +        if(!op->status)
>> +        {
>> +            /* now proceed each list element except head */
>> +            list_for_each(pos, &op->subops.list)
>> +            {
>> +            subops = list_entry(pos, struct subop_struct,
>> list);
>> +               
>> +            for(i = 0; i < subops->ops_num; i++)
>> +            {
>> +                if(op->opcode == MTD_STRIPE_OPCODE_WRITE)
>> +                err = info->subdev->write(info->subdev,
>> subops->ops_array[i].ofs, subops->ops_array[i].len, &retsize,
>> subops->ops_array[i].buf);
>> +                else
>> +                err =
>> info->subdev->write_oob(info->subdev, subops->ops_array[i].ofs,
>> subops->ops_array[i].len, &retsize, subops->ops_array[i].buf);
>> +               
>> +                if(err)
>> +                {
>> +                op->status = -EINVAL;
>> +                printk(KERN_ERR "mtd_stripe: write
>> operation failed %d\n",err);
>> +                break;
>> +                }
>> +            }
>> +                   
>> +            if(op->status)
>> +                break;
>> +            }
>> +        }
>> +        break;
>> +               
>> +        case MTD_STRIPE_OPCODE_ERASE:
>> +        subops = &op->subops;
>> +        instr = (struct erase_info *)subops->ops_array[0].buf;
>> +               
>> +        /* make a local copy of original erase instruction to
>> avoid modifying the caller's struct */
>> +        erase = *instr;
>> +        erase.addr = subops->ops_array[0].ofs;
>> +        erase.len = subops->ops_array[0].len;
>> +
>> +        if ((err = stripe_dev_erase(info->subdev, &erase)))
>> +        {
>> +            /* sanity check: should never happen since
>> +             * block alignment has been checked early in
>> stripe_erase() */
>> +                     +            if(erase.fail_addr != 0xffffffff)
>> +            /* For now this adddres shows address
>> +             * at failed subdevice,but not at "super" device
>> */            +            op->fail_addr = erase.fail_addr; +        }
>> +
>> +        op->status = err;
>> +        op->state = erase.state;
>> +        break;
>> +       
>> +        case MTD_STRIPE_OPCODE_WRITE_ECC:
>> +        /* proceed with list head first */
>> +        subops = &op->subops;
>> +               
>> +        for(i = 0; i < subops->ops_num; i++)
>> +        {
>> +            err = info->subdev->write_ecc(info->subdev,
>> subops->ops_array[i].ofs, subops->ops_array[i].len,
>> +                            &retsize,
>> subops->ops_array[i].buf,
>> +
>> subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
>> +            if(err)
>> +            {
>> +            op->status = -EINVAL;
>> +            printk(KERN_ERR "mtd_stripe: write operation
>> failed %d\n",err);
>> +                break;
>> +            }
>> +        }
>> +               
>> +        if(!op->status)
>> +        {
>> +            /* now proceed each list element except head */
>> +            list_for_each(pos, &op->subops.list)
>> +            {
>> +            subops = list_entry(pos, struct subop_struct,
>> list);
>> +               
>> +            for(i = 0; i < subops->ops_num; i++)
>> +            {
>> +                err = info->subdev->write_ecc(info->subdev,
>> subops->ops_array[i].ofs, subops->ops_array[i].len,
>> +                                &retsize,
>> subops->ops_array[i].buf,
>> +
>> subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
>> +                if(err)
>> +                {
>> +                op->status = -EINVAL;
>> +                printk(KERN_ERR "mtd_stripe: write
>> operation failed %d\n",err);
>> +                break;
>> +                }
>> +            }
>> +                   
>> +            if(op->status)
>> +                break;
>> +            }
>> +        }
>> +        break;
>> +        +        case MTD_STRIPE_OPCODE_READ_ECC:
>> +        case MTD_STRIPE_OPCODE_READ:
>> +        /* proceed with list head first */
>> +        subops = &op->subops;
>> +               
>> +        for(i = 0; i < subops->ops_num; i++)
>> +        {
>> +            if(op->opcode == MTD_STRIPE_OPCODE_READ_ECC)
>> +            {
>> +            err = info->subdev->read_ecc(info->subdev,
>> subops->ops_array[i].ofs, subops->ops_array[i].len,
>> +                            &retsize,
>> subops->ops_array[i].buf,
>> +
>> subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
>> +            }
>> +            else
>> +            {
>> +            err = info->subdev->read(info->subdev,
>> subops->ops_array[i].ofs, subops->ops_array[i].len,
>> +                        &retsize,
>> subops->ops_array[i].buf);
>> +            }
>> +            +            if(err)
>> +            {
>> +            op->status = -EINVAL;
>> +            printk(KERN_ERR "mtd_stripe: read operation
>> failed %d\n",err);
>> +                break;
>> +            }
>> +        }
>> +               
>> +        if(!op->status)
>> +        {
>> +            /* now proceed each list element except head */
>> +            list_for_each(pos, &op->subops.list)
>> +            {
>> +            subops = list_entry(pos, struct subop_struct,
>> list);
>> +               
>> +            for(i = 0; i < subops->ops_num; i++)
>> +            {
>> +                if(op->opcode == MTD_STRIPE_OPCODE_READ_ECC)
>> +                {
>> +                err =
>> info->subdev->read_ecc(info->subdev, subops->ops_array[i].ofs,
>> subops->ops_array[i].len,
>> +                                &retsize,
>> subops->ops_array[i].buf,
>> +
>> subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
>> +                }
>> +                else
>> +                {
>> +                err = info->subdev->read(info->subdev,
>> subops->ops_array[i].ofs, subops->ops_array[i].len,
>> +                                &retsize,
>> subops->ops_array[i].buf);
>> +                }
>> +                +                if(err)
>> +                {
>> +                op->status = -EINVAL;
>> +                printk(KERN_ERR "mtd_stripe: read
>> operation failed %d\n",err);
>> +                break;
>> +                }
>> +            }
>> +                   
>> +            if(op->status)
>> +                break;
>> +            }
>> +        }
>> +        +        break;
>> +               
>> +        default:
>> +        /* unknown operation code */
>> +        printk(KERN_ERR "mtd_stripe: invalid operation code %d",
>> op->opcode);
>> +        op->status = -EINVAL;
>> +        break;
>> +    };
>> +       
>> +    /* remove issued operation from the list */
>> +    spin_lock(&info->list_lock);
>> +    list_del(&op->list);
>> +    spin_unlock(&info->list_lock);
>> +       
>> +    /* raise semaphore to let stripe_write() or stripe_erase()
>> continue */
>> +    up(&op->sem);
>> +    }
>> +   
>> +    info->thread = NULL;
>> +    up(&info->sw_thread_startstop);
>> +}
>> +
>> +/* Launches write to flash thread */
>> +int
>> +stripe_start_write_thread(struct mtd_sw_thread_info* info, struct
>> mtd_info *device)
>> +{
>> +    pid_t pid;
>> +    int ret = 0;
>> +   
>> +    if(info->thread)
>> +    BUG();
>> +       
>> +    info->subdev = device;                /* set the
>> pointer to corresponding device */
>> +
>> +    init_MUTEX_LOCKED(&info->sw_thread_startstop);    /* init
>> start/stop semaphore */
>> +    info->sw_thread = 1;                 /* set continue
>> thread flag */
>> +    init_MUTEX_LOCKED(&info->sw_thread_wait);    /* init "wait for 
>> data"
>> semaphore */
>> +   
>> +    INIT_LIST_HEAD(&info->list);            /* initialize
>> operation list head */
>> +   
>> +    spin_lock_init(&info->list_lock);        /* init list lock */
>> +   
>> +    pid = kernel_thread((int (*)(void *))stripe_write_thread, info,
>> CLONE_KERNEL); /* flags (3rd arg) TBD */
>> +    if (pid < 0)
>> +    {
>> +    printk(KERN_ERR "fork failed for MTD stripe thread: %d\n",
>> -pid);
>> +    ret = pid;
>> +    }
>> +    else
>> +    {
>> +    /* wait thread started */
>> +    DEBUG(MTD_DEBUG_LEVEL1, "MTD stripe: write thread has pid %d\n",
>> pid);
>> +    down(&info->sw_thread_startstop);
>> +    }
>> + +    return ret;
>> +}
>> +
>> +/* Complete write to flash thread */
>> +void
>> +stripe_stop_write_thread(struct mtd_sw_thread_info* info)
>> +{
>> +    if(info->thread)
>> +    {
>> +    info->sw_thread = 0;            /* drop thread flag */
>> +    up(&info->sw_thread_wait);        /* let the thread
>> complete */
>> +    down(&info->sw_thread_startstop);    /* wait for thread
>> completion */
>> +    DEBUG(MTD_DEBUG_LEVEL1, "MTD stripe: writing thread has been
>> stopped\n");
>> +    }
>> +}
>> +
>> +/* Updates write/erase thread priority to max value
>> + * based on operations in the queue
>> + */
>> +void
>> +stripe_set_write_thread_prio(struct mtd_sw_thread_info* info)
>> +{
>> +    struct mtd_stripe_op *op;
>> +    int oldnice, newnice;
>> +    struct list_head *pos;
>> +    +    newnice = oldnice = info->thread->static_prio - MAX_RT_PRIO 
>> - 20;
>> +
>> +    spin_lock(&info->list_lock);
>> +    list_for_each(pos, &info->list)
>> +    {
>> +        op = list_entry(pos, struct mtd_stripe_op, list);
>> +    newnice = (op->op_prio < newnice) ? op->op_prio : newnice;
>> +    }
>> +    spin_unlock(&info->list_lock);
>> +    +    newnice = (newnice < -20) ? -20 : newnice;
>> +    +    if(oldnice != newnice)
>> +    set_user_nice(info->thread, newnice);
>> +}
>> +
>> +/* add sub operation into the array
>> +   op - pointer to the operation structure
>> +   ofs - operation offset within subdevice
>> +   len - data to be written/erased
>> +   buf - pointer to the buffer with data to be written (NULL is erase
>> operation)
>> +   +   returns: 0 - success
>> +*/
>> +static inline int
>> +stripe_add_subop(struct mtd_stripe_op *op, u_int32_t ofs, u_int32_t
>> len, const u_char *buf, const u_char *eccbuf)
>> +{
>> +    u_int32_t size;                /* number of items in
>> the new array (if any) */
>> +    struct subop_struct *subop;
>> +
>> +    if(!op)
>> +    BUG(); /* error */
>> +
>> +    /* get tail list element or head */   
>> +    subop = list_entry(op->subops.list.prev, struct subop_struct,
>> list);
>> +       
>> +    /* check if current suboperation array is already filled or not */
>> +    if(subop->ops_num >= subop->ops_num_max)
>> +    {
>> +    /* array is full. allocate new one and add to list */
>> +    size = SIZEOF_STRUCT_MTD_STRIPE_SUBOP(op->subops.ops_num_max);
>> +    subop = kmalloc(size, GFP_KERNEL);
>> +    if(!subop)
>> +    {
>> +            printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
>> +        return -ENOMEM;
>> +    }
>> +       
>> +    memset(subop, 0, size);
>> +    subop->ops_num = 0;
>> +    subop->ops_num_max = op->subops.ops_num_max;
>> +    subop->ops_array = (struct subop *)(subop + 1);
>> +       
>> +    list_add_tail(&subop->list, &op->subops.list);
>> +    }
>> +
>> +    subop->ops_array[subop->ops_num].ofs = ofs;
>> +    subop->ops_array[subop->ops_num].len = len;
>> +    subop->ops_array[subop->ops_num].buf = (u_char *)buf;
>> +    subop->ops_array[subop->ops_num].eccbuf = (u_char *)eccbuf;
>> +
>> +    subop->ops_num++;    /* increase stored suboperations counter */
>> +   
>> +    return 0;
>> +}
>> +
>> +/* deallocates memory allocated by stripe_add_subop routine */
>> +static void
>> +stripe_destroy_op(struct mtd_stripe_op *op)
>> +{
>> +    struct subop_struct *subop;
>> +   
>> +    while(!list_empty(&op->subops.list))
>> +    {
>> +    subop = list_entry(op->subops.list.next,struct subop_struct,
>> list);
>> +    list_del(&subop->list);
>> +    kfree(subop);
>> +    }
>> +}
>> +
>> +/* adds new operation to the thread queue and unlock wait semaphore for
>> specific thread */
>> +static void
>> +stripe_add_op(struct mtd_sw_thread_info* info, struct mtd_stripe_op*
>> op)
>> +{
>> +    if(!info || !op)
>> +        BUG();
>> +   
>> +    spin_lock(&info->list_lock);
>> +    list_add_tail(&op->list, &info->list);
>> +    spin_unlock(&info->list_lock);
>> +}
>> +
>> +/* End of multithreading support routines */
>> +
>> +
>> +/* + * MTD methods which look up the relevant subdevice, translate the
>> + * effective address and pass through to the subdevice.
>> + */
>> +
>> +
>> +/* sychroneous read from striped volume */
>> +static int
>> +stripe_read_sync(struct mtd_info *mtd, loff_t from, size_t len,
>> +        size_t * retlen, u_char * buf)
>> +{
>> +    u_int32_t from_loc = (u_int32_t)from;    /* we can do this since
>> whole MTD size in current implementation has u_int32_t type */
>> +   
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned with erasesize data block
>> */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to read/write
>> left (bytes) */
>> +    size_t retsize;            /* data read/written from/to
>> subdev (bytes) */
>> +
>> +    *retlen = 0;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_sync(): offset = 0x%08x, size
>> = %d\n", from_loc, len);
>> +
>> +    /* Check whole striped device bounds here */
>> +    if(from_loc + len > mtd->size)
>> +    {
>> +    return err;
>> +    }
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(from_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +            dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((from_loc -
>> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
>> dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (from_loc / stripe->interleave_size) /
>> dev_count;
>> +    subdev_number = (from_loc / stripe->interleave_size) %
>> dev_count;
>> +    }
>> +
>> +    subdev_offset_low = from_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* Synch read here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_sync(): device = %d, offset =
>> 0x%08x, len = %d\n", subdev_number, subdev_offset_low, subdev_len);
>> +    err =
>> stripe->subdev[subdev_number]->read(stripe->subdev[subdev_number],
>> subdev_offset_low, subdev_len, &retsize, buf);
>> +    if(!err)
>> +    {
>> +    *retlen += retsize;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +    if(from_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +            dev_count--;
>> +    }
>> +       
>> +    while(!err && len_left > 0 && dev_count > 0)
>> +    {
>> +        subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +
>> +    /* Synch read here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_sync(): device = %d, offset
>> = 0x%08x, len = %d\n", subdev_number, subdev_offset *
>> stripe->interleave_size, subdev_len);
>> +    err =
>> stripe->subdev[subdev_number]->read(stripe->subdev[subdev_number],
>> subdev_offset * stripe->interleave_size, subdev_len, &retsize, buf);
>> +    if(err)
>> +        break;
>> +           
>> +    *retlen += retsize;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +       
>> +    if(from_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +        dev_count--;
>> +    }
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_sync(): read %d bytes\n",
>> *retlen);
>> +    return err;
>> +}
>> +
>> +
>> +/* asychroneous read from striped volume */
>> +static int
>> +stripe_read_async(struct mtd_info *mtd, loff_t from, size_t len,
>> +        size_t * retlen, u_char * buf)
>> +{
>> +    u_int32_t from_loc = (u_int32_t)from;    /* we can do this since
>> whole MTD size in current implementation has u_int32_t type */
>> +   
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned with erasesize data block
>> */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to read/write
>> left (bytes) */
>> +
>> +    struct mtd_stripe_op *ops;        /* operations array (one per
>> thread) */
>> +    u_int32_t size;            /* amount of memory to be
>> allocated for thread operations */
>> +    u_int32_t queue_size;
>> +
>> +    *retlen = 0;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_async(): offset = 0x%08x, size
>> = %d\n", from_loc, len);
>> +
>> +    /* Check whole striped device bounds here */
>> +    if(from_loc + len > mtd->size)
>> +    {
>> +    return err;
>> +    }
>> +
>> +    /* allocate memory for multithread operations */
>> +    queue_size = len / stripe->interleave_size / stripe->num_subdev +
>> 1;    /* default queue size. could be set to predefined value */
>> +    size = stripe->num_subdev *
>> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
>> +    ops = kmalloc(size, GFP_KERNEL);
>> +    if(!ops)
>> +    {
>> +    printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
>> +    return -ENOMEM;
>> +    }
>> +   
>> +    memset(ops, 0, size);
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    ops[i].opcode = MTD_STRIPE_OPCODE_READ;
>> +    ops[i].caller_id = 0;             /* TBD */
>> +    init_MUTEX_LOCKED(&ops[i].sem);        /* mutex is locked here.
>> to be unlocked by device thread */
>> +    //ops[i].status = 0;            /* TBD */
>> +
>> +    INIT_LIST_HEAD(&ops[i].subops.list);    /* initialize
>> suboperation list head */
>> +
>> +    ops[i].subops.ops_num = 0;        /* to be increased later
>> here */
>> +    ops[i].subops.ops_num_max = queue_size;    /* total number of
>> suboperations can be stored in the array */
>> +    ops[i].subops.ops_array = (struct subop *)((char *)(ops +
>> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
>> +    }
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(from_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +            dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((from_loc -
>> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
>> dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (from_loc / stripe->interleave_size) /
>> dev_count;
>> +    subdev_number = (from_loc / stripe->interleave_size) %
>> dev_count;
>> +    }
>> +
>> +    subdev_offset_low = from_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* asynch read here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_async(): device = %d, offset =
>> 0x%08x, len = %d\n", subdev_number, subdev_offset_low, subdev_len);
>> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
>> subdev_len, buf, NULL);
>> +    if(!err)
>> +    {
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +    if(from_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +            dev_count--;
>> +    }
>> +       
>> +    while(!err && len_left > 0 && dev_count > 0)
>> +    {
>> +        subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +
>> +    /* Synch read here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_async(): device = %d,
>> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset *
>> stripe->interleave_size, subdev_len);
>> +        err = stripe_add_subop(&ops[subdev_number], subdev_offset *
>> stripe->interleave_size, subdev_len, buf, NULL);
>> +    if(err)
>> +        break;
>> +           
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +       
>> +    if(from_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +        dev_count--;
>> +    }
>> +
>> +    /* Push operation into the corresponding threads queue and rise
>> semaphores */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_add_op(&stripe->sw_threads[i], &ops[i]);
>> +
>> +    /* set original operation priority */
>> +    ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
>> +    stripe_set_write_thread_prio(&stripe->sw_threads[i]);
>> +
>> +    up(&stripe->sw_threads[i].sw_thread_wait);
>> +    }
>> +   
>> +    /* wait for all suboperations completed and check status */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    down(&ops[i].sem);
>> +       
>> +    /* set error if one of operations has failed */
>> +    if(ops[i].status)
>> +        err = ops[i].status;
>> +    }
>> +
>> +    /* Deallocate all memory before exit */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_destroy_op(&ops[i]);
>> +    }
>> +    kfree(ops);
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_async(): read %d bytes\n",
>> *retlen);
>> +    return err;
>> +}
>> +
>> +
>> +static int
>> +stripe_read(struct mtd_info *mtd, loff_t from, size_t len,
>> +        size_t * retlen, u_char * buf)
>> +{
>> +    int err;
>> +    if(mtd->type == MTD_NANDFLASH)
>> +    err = stripe_read_async(mtd, from, len, retlen, buf);
>> +    else
>> +    err = stripe_read_sync(mtd, from, len, retlen, buf);
>> +
>> +    return err;
>> +}
>> +
>> +
>> +static int
>> +stripe_write(struct mtd_info *mtd, loff_t to, size_t len,
>> +         size_t * retlen, const u_char * buf)
>> +{
>> +    u_int32_t to_loc = (u_int32_t)to;    /* we can do this since whole
>> MTD size in current implementation has u_int32_t type */
>> +
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned block */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to read/write
>> left (bytes) */
>> +   
>> +    struct mtd_stripe_op *ops;        /* operations array (one per
>> thread) */
>> +    u_int32_t size;            /* amount of memory to be
>> allocated for thread operations */
>> +    u_int32_t queue_size;
>> +
>> +    *retlen = 0;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write(): offset = 0x%08x, size =
>> %d\n", to_loc, len);
>> +   
>> +    /* check if no data is going to be written */
>> +    if(!len)
>> +        return 0;
>> +   
>> +    /* Check whole striped device bounds here */
>> +    if(to_loc + len > mtd->size)
>> +        return err;
>> +   
>> +    /* allocate memory for multithread operations */
>> +    queue_size = len / stripe->interleave_size / stripe->num_subdev +
>> 1;    /* default queue size. could be set to predefined value */
>> +    size = stripe->num_subdev *
>> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
>> +    ops = kmalloc(size, GFP_KERNEL);
>> +    if(!ops)
>> +    {
>> +    printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
>> +    return -ENOMEM;
>> +    }
>> +   
>> +    memset(ops, 0, size);
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    ops[i].opcode = MTD_STRIPE_OPCODE_WRITE;
>> +    ops[i].caller_id = 0;             /* TBD */
>> +    init_MUTEX_LOCKED(&ops[i].sem);        /* mutex is locked here.
>> to be unlocked by device thread */
>> +    //ops[i].status = 0;            /* TBD */
>> +
>> +    INIT_LIST_HEAD(&ops[i].subops.list);    /* initialize
>> suboperation list head */
>> +
>> +    ops[i].subops.ops_num = 0;        /* to be increased later
>> here */
>> +    ops[i].subops.ops_num_max = queue_size;    /* total number of
>> suboperations can be stored in the array */
>> +    ops[i].subops.ops_array = (struct subop *)((char *)(ops +
>> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
>> +    }
>> +                       
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(to_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +        dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((to_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((to_loc - stripe->subdev_last_offset[i
>> - 1]) / stripe->interleave_size) % dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (to_loc / stripe->interleave_size) / dev_count;
>> +    subdev_number = (to_loc / stripe->interleave_size) % dev_count;
>> +    }
>> +   
>> +    subdev_offset_low = to_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* Add suboperation to queue here */
>> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
>> subdev_len, buf, NULL);
>> +    if(!err)
>> +    {
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +    if(to_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +            dev_count--;
>> +    }
>> +           
>> +    while(!err && len_left > 0 && dev_count > 0)
>> +    {
>> +    subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +
>> +    /* Add suboperation to queue here */
>> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset *
>> stripe->interleave_size, subdev_len, buf, NULL);
>> +    if(err)
>> +        break;
>> +           
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +       
>> +    if(to_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +        dev_count--;
>> +    }
>> +    +    /* Push operation into the corresponding threads queue and 
>> rise
>> semaphores */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_add_op(&stripe->sw_threads[i], &ops[i]);
>> +
>> +    /* set original operation priority */
>> +    ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
>> +    stripe_set_write_thread_prio(&stripe->sw_threads[i]);
>> +
>> +    up(&stripe->sw_threads[i].sw_thread_wait);
>> +    }
>> +   
>> +    /* wait for all suboperations completed and check status */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    down(&ops[i].sem);
>> +       
>> +    /* set error if one of operations has failed */
>> +    if(ops[i].status)
>> +        err = ops[i].status;
>> +    }
>> +
>> +    /* Deallocate all memory before exit */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_destroy_op(&ops[i]);
>> +    }
>> +    kfree(ops);
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write(): written %d bytes\n",
>> *retlen);
>> +    return err;
>> +}
>> +
>> +
>> +/* synchroneous ecc read from striped volume */
>> +static int
>> +stripe_read_ecc_sync(struct mtd_info *mtd, loff_t from, size_t len,
>> +            size_t * retlen, u_char * buf, u_char * eccbuf,
>> +            struct nand_oobinfo *oobsel)
>> +{
>> +    u_int32_t from_loc = (u_int32_t)from;    /* we can do this since
>> whole MTD size in current implementation has u_int32_t type */
>> +   
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned with erasesize data block
>> */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to read/write
>> left (bytes) */
>> +    size_t retsize;            /* data read/written from/to
>> subdev (bytes) */
>> +    +    *retlen = 0;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_sync(): offset = 0x%08x,
>> size = %d\n", from_loc, len);
>> +    +    if(oobsel != NULL)
>> +    {
>> +        /* check if oobinfo is has been chandes by FS */
>> +    if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
>> +    {
>> +        printk(KERN_ERR "stripe_read_ecc_sync(): oobinfo has been
>> changed by FS (not supported yet)\n");
>> +        return err;
>> +    }
>> +    }
>> +
>> +    /* Check whole striped device bounds here */
>> +    if(from_loc + len > mtd->size)
>> +    {
>> +    return err;
>> +    }
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(from_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +            dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((from_loc -
>> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
>> dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (from_loc / stripe->interleave_size) /
>> dev_count;
>> +    subdev_number = (from_loc / stripe->interleave_size) %
>> dev_count;
>> +    }
>> +
>> +    subdev_offset_low = from_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* Synch read here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_sync(): device = %d,
>> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset_low,
>> subdev_len);
>> +    err =
>> stripe->subdev[subdev_number]->read_ecc(stripe->subdev[subdev_number],
>> subdev_offset_low, subdev_len, &retsize, buf, eccbuf,
>> &stripe->subdev[subdev_number]->oobinfo);
>> +    if(!err)
>> +    {
>> +    *retlen += retsize;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +    eccbuf += stripe->subdev[subdev_number]->oobavail;
>> +   
>> +    if(from_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +            dev_count--;
>> +    }
>> +       
>> +    while(!err && len_left > 0 && dev_count > 0)
>> +    {
>> +        subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +
>> +    /* Synch read here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_sync(): device = %d,
>> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset *
>> stripe->interleave_size, subdev_len);
>> +    err =
>> stripe->subdev[subdev_number]->read_ecc(stripe->subdev[subdev_number],
>> subdev_offset * stripe->interleave_size, subdev_len, &retsize, buf,
>> eccbuf, &stripe->subdev[subdev_number]->oobinfo);
>> +    if(err)
>> +        break;
>> +           
>> +    *retlen += retsize;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +    eccbuf += stripe->subdev[subdev_number]->oobavail;
>> +       
>> +    if(from + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +        dev_count--;
>> +    }
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_sync(): read %d bytes\n",
>> *retlen);
>> +    return err;
>> +}
>> +
>> +
>> +/* asynchroneous ecc read from striped volume */
>> +static int
>> +stripe_read_ecc_async(struct mtd_info *mtd, loff_t from, size_t len,
>> +            size_t * retlen, u_char * buf, u_char * eccbuf,
>> +            struct nand_oobinfo *oobsel)
>> +{
>> +    u_int32_t from_loc = (u_int32_t)from;    /* we can do this since
>> whole MTD size in current implementation has u_int32_t type */
>> +   
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned with erasesize data block
>> */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to read/write
>> left (bytes) */
>> +
>> +    struct mtd_stripe_op *ops;        /* operations array (one per
>> thread) */
>> +    u_int32_t size;            /* amount of memory to be
>> allocated for thread operations */
>> +    u_int32_t queue_size;
>> +    +    *retlen = 0;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_async(): offset = 0x%08x,
>> size = %d\n", from_loc, len);
>> +    +    if(oobsel != NULL)
>> +    {
>> +        /* check if oobinfo is has been chandes by FS */
>> +    if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
>> +    {
>> +        printk(KERN_ERR "stripe_read_ecc_async(): oobinfo has been
>> changed by FS (not supported yet)\n");
>> +        return err;
>> +    }
>> +    }
>> +
>> +    /* Check whole striped device bounds here */
>> +    if(from_loc + len > mtd->size)
>> +    {
>> +    return err;
>> +    }
>> +
>> +    /* allocate memory for multithread operations */
>> +    queue_size = len / stripe->interleave_size / stripe->num_subdev +
>> 1;    /* default queue size. could be set to predefined value */
>> +    size = stripe->num_subdev *
>> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
>> +    ops = kmalloc(size, GFP_KERNEL);
>> +    if(!ops)
>> +    {
>> +    printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
>> +    return -ENOMEM;
>> +    }
>> +   
>> +    memset(ops, 0, size);
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    ops[i].opcode = MTD_STRIPE_OPCODE_READ_ECC;
>> +    ops[i].caller_id = 0;             /* TBD */
>> +    init_MUTEX_LOCKED(&ops[i].sem);        /* mutex is locked here.
>> to be unlocked by device thread */
>> +    //ops[i].status = 0;            /* TBD */
>> +
>> +    INIT_LIST_HEAD(&ops[i].subops.list);    /* initialize
>> suboperation list head */
>> +
>> +    ops[i].subops.ops_num = 0;        /* to be increased later
>> here */
>> +    ops[i].subops.ops_num_max = queue_size;    /* total number of
>> suboperations can be stored in the array */
>> +    ops[i].subops.ops_array = (struct subop *)((char *)(ops +
>> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
>> +    }
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(from_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +            dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((from_loc -
>> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
>> dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (from_loc / stripe->interleave_size) /
>> dev_count;
>> +    subdev_number = (from_loc / stripe->interleave_size) %
>> dev_count;
>> +    }
>> +
>> +    subdev_offset_low = from_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* Issue read operation here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_async(): device = %d,
>> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset_low,
>> subdev_len);
>> +
>> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
>> subdev_len, buf, eccbuf);
>> +    if(!err)
>> +    {
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +    if(eccbuf)
>> +        eccbuf += stripe->subdev[subdev_number]->oobavail;
>> +   
>> +    if(from_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +            dev_count--;
>> +    }
>> +       
>> +    while(!err && len_left > 0 && dev_count > 0)
>> +    {
>> +        subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +
>> +    /* Issue read operation here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_async(): device = %d,
>> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset *
>> stripe->interleave_size, subdev_len);
>> +
>> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset *
>> stripe->interleave_size, subdev_len, buf, eccbuf);
>> +    if(err)
>> +        break;
>> +
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +    if(eccbuf)
>> +        eccbuf += stripe->subdev[subdev_number]->oobavail;
>> +       
>> +    if(from + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +        dev_count--;
>> +    }
>> +
>> +    /* Push operation into the corresponding threads queue and rise
>> semaphores */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_add_op(&stripe->sw_threads[i], &ops[i]);
>> +
>> +    /* set original operation priority */
>> +    ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
>> +    stripe_set_write_thread_prio(&stripe->sw_threads[i]);
>> +
>> +    up(&stripe->sw_threads[i].sw_thread_wait);
>> +    }
>> +   
>> +    /* wait for all suboperations completed and check status */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    down(&ops[i].sem);
>> +       
>> +    /* set error if one of operations has failed */
>> +    if(ops[i].status)
>> +        err = ops[i].status;
>> +    }
>> +
>> +    /* Deallocate all memory before exit */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_destroy_op(&ops[i]);
>> +    }
>> +    kfree(ops);
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_async(): read %d bytes\n",
>> *retlen);
>> +    return err;
>> +}
>> +
>> +
>> +static int
>> +stripe_read_ecc(struct mtd_info *mtd, loff_t from, size_t len,
>> +            size_t * retlen, u_char * buf, u_char * eccbuf,
>> +        struct nand_oobinfo *oobsel)
>> +{
>> +    int err;
>> +    if(mtd->type == MTD_NANDFLASH)
>> +    err = stripe_read_ecc_async(mtd, from, len, retlen, buf, eccbuf,
>> oobsel);
>> +    else
>> +    err = stripe_read_ecc_sync(mtd, from, len, retlen, buf, eccbuf,
>> oobsel);
>> +    +    return err;
>> +}
>> +
>> +
>> +static int
>> +stripe_write_ecc(struct mtd_info *mtd, loff_t to, size_t len,
>> +         size_t * retlen, const u_char * buf, u_char * eccbuf,
>> +         struct nand_oobinfo *oobsel)
>> +{
>> +    u_int32_t to_loc = (u_int32_t)to;    /* we can do this since whole
>> MTD size in current implementation has u_int32_t type */
>> +
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned block */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to read/write
>> left (bytes) */
>> +   
>> +    struct mtd_stripe_op *ops;        /* operations array (one per
>> thread) */
>> +    u_int32_t size;            /* amount of memory to be
>> allocated for thread operations */
>> +    u_int32_t queue_size;
>> +    +    *retlen = 0;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_ecc(): offset = 0x%08x, size
>> = %d\n", to_loc, len);
>> +
>> +    if(oobsel != NULL)
>> +    {
>> +        /* check if oobinfo is has been chandes by FS */
>> +    if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
>> +    {
>> +        printk(KERN_ERR "stripe_write_ecc(): oobinfo has been
>> changed by FS (not supported yet)\n");
>> +        return err;
>> +    }
>> +    }
>> +   
>> +    /* check if no data is going to be written */
>> +    if(!len)
>> +        return 0;
>> +   
>> +    /* Check whole striped device bounds here */
>> +    if(to_loc + len > mtd->size)
>> +        return err;
>> +   
>> +    /* allocate memory for multithread operations */
>> +    queue_size = len / stripe->interleave_size / stripe->num_subdev +
>> 1;    /* default queue size */
>> +    size = stripe->num_subdev *
>> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
>> +    ops = kmalloc(size, GFP_KERNEL);
>> +    if(!ops)
>> +    {
>> +    printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
>> +    return -ENOMEM;
>> +    }
>> +   
>> +    memset(ops, 0, size);
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    ops[i].opcode = MTD_STRIPE_OPCODE_WRITE_ECC;
>> +    ops[i].caller_id = 0;             /* TBD */
>> +    init_MUTEX_LOCKED(&ops[i].sem);        /* mutex is locked here.
>> to be unlocked by device thread */
>> +    //ops[i].status = 0;            /* TBD */
>> +
>> +    INIT_LIST_HEAD(&ops[i].subops.list);    /* initialize
>> suboperation list head */
>> +
>> +    ops[i].subops.ops_num = 0;        /* to be increased later
>> here */
>> +    ops[i].subops.ops_num_max = queue_size;    /* total number of
>> suboperations can be stored in the array */
>> +    ops[i].subops.ops_array = (struct subop *)((char *)(ops +
>> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
>> +    }
>> +                       
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(to_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +        dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((to_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((to_loc - stripe->subdev_last_offset[i
>> - 1]) / stripe->interleave_size) % dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (to_loc / stripe->interleave_size) / dev_count;
>> +    subdev_number = (to_loc / stripe->interleave_size) % dev_count;
>> +    }
>> +   
>> +    subdev_offset_low = to_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* Add suboperation to queue here */
>> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
>> subdev_len, buf, eccbuf);
>> +    if(!err)
>> +    {
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +    if(eccbuf)
>> +        eccbuf += stripe->subdev[subdev_number]->oobavail;
>> +   
>> +    if(to_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +            dev_count--;
>> +    }
>> +           
>> +    while(!err && len_left > 0 && dev_count > 0)
>> +    {
>> +    subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +
>> +    /* Add suboperation to queue here */
>> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset *
>> stripe->interleave_size, subdev_len, buf, eccbuf);
>> +    if(err)
>> +        break;
>> +           
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +    if(eccbuf)
>> +        eccbuf += stripe->subdev[subdev_number]->oobavail;
>> +       
>> +    if(to_loc + *retlen >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +        dev_count--;
>> +    }
>> +    +    /* Push operation into the corresponding threads queue and 
>> rise
>> semaphores */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_add_op(&stripe->sw_threads[i], &ops[i]);
>> +
>> +    /* set original operation priority */
>> +    ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
>> +    stripe_set_write_thread_prio(&stripe->sw_threads[i]);
>> +
>> +    up(&stripe->sw_threads[i].sw_thread_wait);
>> +    }
>> +   
>> +    /* wait for all suboperations completed and check status */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    down(&ops[i].sem);
>> +       
>> +    /* set error if one of operations has failed */
>> +    if(ops[i].status)
>> +        err = ops[i].status;
>> +    }
>> +
>> +    /* Deallocate all memory before exit */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_destroy_op(&ops[i]);
>> +    }
>> +    kfree(ops);
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_ecc(): written %d bytes\n",
>> *retlen);
>> +    return err;
>> +}
>> +
>> +
>> +static int
>> +stripe_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
>> +        size_t * retlen, u_char * buf)
>> +{
>> +    u_int32_t from_loc = (u_int32_t)from;    /* we can do this since
>> whole MTD size in current implementation has u_int32_t type */
>> +   
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned with erasesize data block
>> */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to read/write
>> left (bytes) */
>> +    size_t retsize;            /* data read/written from/to
>> subdev (bytes) */
>> +    +    //u_int32_t subdev_oobavail = stripe->subdev[0]->oobavail;
>> +    u_int32_t subdev_oobavail = stripe->subdev[0]->oobsize;
>> +   
>> +    *retlen = 0;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_oob(): offset = 0x%08x, size =
>> %d\n", from_loc, len);
>> +
>> +    /* Check whole striped device bounds here */
>> +    if(from_loc + len > mtd->size)
>> +    {
>> +    return err;
>> +    }
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(from_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +            dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((from_loc -
>> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
>> dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (from_loc / stripe->interleave_size) /
>> dev_count;
>> +    subdev_number = (from_loc / stripe->interleave_size) %
>> dev_count;
>> +    }
>> +
>> +    subdev_offset_low = from_loc % subdev_oobavail;
>> +    subdev_len = (len_left < (subdev_oobavail - subdev_offset_low)) ?
>> len_left : (subdev_oobavail - subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* Synch read here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_oob(): device = %d, offset =
>> 0x%08x, len = %d\n", subdev_number, subdev_offset_low, subdev_len);
>> +    err =
>> stripe->subdev[subdev_number]->read_oob(stripe->subdev[subdev_number],
>> subdev_offset_low, subdev_len, &retsize, buf);
>> +    if(!err)
>> +    {
>> +    *retlen += retsize;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +
>> +    /* increase flash offset by interleave size since oob blocks 
>> +     * aligned with page size (i.e. interleave size) */
>> +    from_loc += stripe->interleave_size;
>> +   
>> +    if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev -
>> dev_count])
>> +            dev_count--;
>> +    }
>> +       
>> +    while(!err && len_left > 0 && dev_count > 0)
>> +    {
>> +        subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < subdev_oobavail) ? len_left :
>> subdev_oobavail;
>> +
>> +    /* Synch read here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_oob(): device = %d, offset
>> = 0x%08x, len = %d\n", subdev_number, subdev_offset *
>> stripe->interleave_size, subdev_len);
>> +    err =
>> stripe->subdev[subdev_number]->read_oob(stripe->subdev[subdev_number],
>> subdev_offset * stripe->interleave_size, subdev_len, &retsize, buf);
>> +    if(err)
>> +        break;
>> +           
>> +    *retlen += retsize;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +
>> +    /* increase flash offset by interleave size since oob blocks 
>> +     * aligned with page size (i.e. interleave size) */
>> +    from_loc += stripe->interleave_size;
>> +       
>> +    if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev -
>> dev_count])
>> +        dev_count--;
>> +    }
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_oob(): read %d bytes\n",
>> *retlen);
>> +    return err;
>> +}
>> +
>> +static int
>> +stripe_write_oob(struct mtd_info *mtd, loff_t to, size_t len,
>> +         size_t *retlen, const u_char * buf)
>> +{
>> +    u_int32_t to_loc = (u_int32_t)to;    /* we can do this since whole
>> MTD size in current implementation has u_int32_t type */
>> +
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned block */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to read/write
>> left (bytes) */
>> +   
>> +    struct mtd_stripe_op *ops;        /* operations array (one per
>> thread) */
>> +    u_int32_t size;            /* amount of memory to be
>> allocated for thread operations */
>> +    u_int32_t queue_size;
>> +    +    //u_int32_t subdev_oobavail = stripe->subdev[0]->oobavail;
>> +    u_int32_t subdev_oobavail = stripe->subdev[0]->oobsize;
>> +
>> +    *retlen = 0;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_oob(): offset = 0x%08x, size
>> = %d\n", to_loc, len);
>> +   
>> +    /* check if no data is going to be written */
>> +    if(!len)
>> +        return 0;
>> +   
>> +    /* Check whole striped device bounds here */
>> +    if(to_loc + len > mtd->size)
>> +        return err;
>> +   
>> +    /* allocate memory for multithread operations */
>> +    queue_size = len / subdev_oobavail / stripe->num_subdev + 1;
>> /* default queue size. could be set to predefined value */
>> +    size = stripe->num_subdev *
>> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
>> +    ops = kmalloc(size, GFP_KERNEL);
>> +    if(!ops)
>> +    {
>> +    printk(KERN_ERR "stripe_write_oob(): memory allocation
>> error!\n");
>> +    return -ENOMEM;
>> +    }
>> +   
>> +    memset(ops, 0, size);
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    ops[i].opcode = MTD_STRIPE_OPCODE_WRITE_OOB;
>> +    ops[i].caller_id = 0;             /* TBD */
>> +    init_MUTEX_LOCKED(&ops[i].sem);        /* mutex is locked here.
>> to be unlocked by device thread */
>> +    //ops[i].status = 0;            /* TBD */
>> +
>> +    INIT_LIST_HEAD(&ops[i].subops.list);    /* initialize
>> suboperation list head */
>> +
>> +    ops[i].subops.ops_num = 0;        /* to be increased later
>> here */
>> +    ops[i].subops.ops_num_max = queue_size;    /* total number of
>> suboperations can be stored in the array */
>> +    ops[i].subops.ops_array = (struct subop *)((char *)(ops +
>> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
>> +    }
>> +                       
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(to_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +        dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((to_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((to_loc - stripe->subdev_last_offset[i
>> - 1]) / stripe->interleave_size) % dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (to_loc / stripe->interleave_size) / dev_count;
>> +    subdev_number = (to_loc / stripe->interleave_size) % dev_count;
>> +    }
>> +   
>> +    subdev_offset_low = to_loc % subdev_oobavail;
>> +    subdev_len = (len_left < (subdev_oobavail - subdev_offset_low)) ?
>> len_left : (subdev_oobavail - subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* Add suboperation to queue here */
>> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
>> subdev_len, buf, NULL);
>> +
>>
>> +    if(!err)
>> +    {
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +   
>> +    /* increase flash offset by interleave size since oob blocks 
>> +     * aligned with page size (i.e. interleave size) */
>> +    to_loc += stripe->interleave_size;
>> +
>> +    if(to_loc >= stripe->subdev_last_offset[stripe->num_subdev -
>> dev_count])
>> +            dev_count--;
>> +    }
>> +           
>> +    while(!err && len_left > 0 && dev_count > 0)
>> +    {
>> +    subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < subdev_oobavail) ? len_left :
>> subdev_oobavail;
>> +
>> +    /* Add suboperation to queue here */
>> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset *
>> stripe->interleave_size, subdev_len, buf, NULL);
>> +    if(err)
>> +        break;
>> +           
>> +    *retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    buf += subdev_len;
>> +
>> +    /* increase flash offset by interleave size since oob blocks 
>> +     * aligned with page size (i.e. interleave size) */
>> +    to_loc += stripe->interleave_size;
>> +       
>> +    if(to_loc >= stripe->subdev_last_offset[stripe->num_subdev -
>> dev_count])
>> +        dev_count--;
>> +    }
>> +    +    /* Push operation into the corresponding threads queue and 
>> rise
>> semaphores */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_add_op(&stripe->sw_threads[i], &ops[i]);
>> +
>> +    /* set original operation priority */
>> +    ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
>> +    stripe_set_write_thread_prio(&stripe->sw_threads[i]);
>> +
>> +    up(&stripe->sw_threads[i].sw_thread_wait);
>> +    }
>> +   
>> +    /* wait for all suboperations completed and check status */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    down(&ops[i].sem);
>> +       
>> +    /* set error if one of operations has failed */
>> +    if(ops[i].status)
>> +        err = ops[i].status;
>> +    }
>> +
>> +    /* Deallocate all memory before exit */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_destroy_op(&ops[i]);
>> +    }
>> +    kfree(ops);
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_oob(): written %d bytes\n",
>> *retlen);
>> +    return err;
>> +}
>> +
>> +/* this routine aimed to support striping on NOR_ECC
>> + * it has been taken from cfi_cmdset_0001.c
>> + */
>> +static int +stripe_writev (struct mtd_info *mtd, const struct kvec 
>> *vecs, unsigned
>> long count, +        loff_t to, size_t * retlen)
>> +{
>> +    int i, page, len, total_len, ret = 0, written = 0, cnt = 0,
>> towrite;
>> +    u_char *bufstart;
>> +    char* data_poi;
>> +    char* data_buf;
>> +    loff_t write_offset;
>> +    int rl_wr;
>> +
>> +    u_int32_t pagesize;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "==> stripe_writev()\n");
>> +
>> +#ifdef MTD_PROGRAM_REGIONS
>> +    /* Montavista patch for Sibley support detected */    +    
>> if(mtd->flags & MTD_PROGRAM_REGIONS)
>> +    {
>> +    pagesize = MTD_PROGREGION_SIZE(mtd);
>> +    }
>> +    else if(mtd->flags & MTD_ECC)
>> +    {
>> +    pagesize = mtd->eccsize;
>> +    }
>> +    else
>> +    {
>> +    printk(KERN_ERR "stripe_writev() has been called for device
>> without MTD_PROGRAM_REGIONS or MTD_ECC set\n");
>> +    return -EINVAL;
>> +    }
>> +#else
>> +    if(mtd->flags & MTD_ECC)
>> +    {
>> +    pagesize = mtd->eccsize;
>> +    }
>> +    else
>> +    {
>> +    printk(KERN_ERR "stripe_writev() has been called for device
>> without MTD_ECC set\n");
>> +    return -EINVAL;
>> +    }
>> +#endif
>> +    +    data_buf = kmalloc(pagesize, GFP_KERNEL);
>> +    +    /* Preset written len for early exit */
>> +    *retlen = 0;
>> +
>> +    /* Calculate total length of data */
>> +    total_len = 0;
>> +    for (i = 0; i < count; i++)
>> +        total_len += (int) vecs[i].iov_len;
>> +
>> +    /* check if no data is going to be written */
>> +    if(!total_len)
>> +    {
>> +    kfree(data_buf);
>> +    return 0;
>> +    }
>> +
>> +    /* Do not allow write past end of page */
>> +    if ((to + total_len) > mtd->size) {
>> +    DEBUG (MTD_DEBUG_LEVEL0, "stripe_writev(): Attempted write past
>> end of device\n");
>> +        kfree(data_buf);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* Setup start page */
>> +    page = ((int) to) / pagesize;
>> +    towrite = (page + 1) * pagesize - to;  /* rest of the page */
>> +    write_offset = to;
>> +    written = 0; +    /* Loop until all iovecs' data has been 
>> written */
>> +    len = 0;
>> +    while (len < total_len) {
>> +        bufstart = (u_char *)vecs->iov_base;
>> +        bufstart += written;
>> +        data_poi = bufstart;
>> +
>> +        /* If the given tuple is >= reet of page then
>> +         * write it out from the iov
>> +     */
>> +    if ( (vecs->iov_len-written) >= towrite) {       /* The fastest
>> case is to write data by int * blocksize */
>> +        ret = mtd->write(mtd, write_offset, towrite, &rl_wr,
>> data_poi);
>> +        if(ret)
>> +            break;
>> +            len += towrite;
>> +            page ++;
>> +            write_offset = page * pagesize;
>> +            towrite = pagesize;
>> +            written += towrite;
>> +            if(vecs->iov_len  == written) {
>> +                vecs ++;
>> +                written = 0;
>> +            }
>> +      }
>> +      else +      {
>> +          cnt = 0;
>> +        while(cnt < towrite ) {
>> +            data_buf[cnt++] = ((u_char *)
>> vecs->iov_base)[written++];
>> +                if(vecs->iov_len == written )
>> +                {
>> +            if((cnt+len) == total_len )
>> +                    break;
>> +                    vecs ++;
>> +                written = 0;
>> +        }
>> +        }
>> +        data_poi = data_buf;
>> +        ret = mtd->write(mtd, write_offset, cnt, &rl_wr, data_poi);
>> +        if (ret)
>> +            break;
>> +        len += cnt;
>> +            page ++;
>> +        write_offset = page * pagesize;
>> +        towrite = pagesize;
>> +      }
>> +    }
>> +
>> +    if(retlen)
>> +    *retlen = len;
>> +    kfree(data_buf);
>> +    +    DEBUG(MTD_DEBUG_LEVEL2, "<== stripe_writev()\n");
>> +    +    return ret;
>> +}
>> +
>> +
>> +static int +stripe_writev_ecc (struct mtd_info *mtd, const struct 
>> kvec *vecs,
>> unsigned long count, +            loff_t to, size_t * retlen, u_char 
>> *eccbuf, struct
>> nand_oobinfo *oobsel)
>> +{
>> +    int i, page, len, total_len, ret = 0, written = 0, cnt = 0,
>> towrite;
>> +    u_char *bufstart;
>> +    char* data_poi;
>> +    char* data_buf;
>> +    loff_t write_offset;
>> +    data_buf = kmalloc(mtd->oobblock, GFP_KERNEL);
>> +    int rl_wr;
>> +    +    DEBUG(MTD_DEBUG_LEVEL2, "==> stripe_writev_ecc()\n");
>> +
>> +    if(oobsel != NULL)
>> +    {
>> +        /* check if oobinfo is has been chandes by FS */
>> +    if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
>> +    {
>> +        printk(KERN_ERR "stripe_writev_ecc(): oobinfo has been
>> changed by FS (not supported yet)\n");
>> +        kfree(data_buf);
>> +        return -EINVAL;
>> +    }
>> +    }
>> +    +    if(!(mtd->flags & MTD_ECC))
>> +    {
>> +    printk(KERN_ERR "stripe_writev_ecc() has been called for device
>> without MTD_ECC set\n");
>> +    kfree(data_buf);
>> +    return -EINVAL;
>> +    }
>> +    +    /* Preset written len for early exit */
>> +    *retlen = 0;
>> +
>> +    /* Calculate total length of data */
>> +    total_len = 0;
>> +    for (i = 0; i < count; i++)
>> +        total_len += (int) vecs[i].iov_len;
>> +
>> +    /* check if no data is going to be written */
>> +    if(!total_len)
>> +    {
>> +    kfree(data_buf);
>> +    return 0;
>> +    }
>> +
>> +    /* Do not allow write past end of page */
>> +    if ((to + total_len) > mtd->size) {
>> +    DEBUG (MTD_DEBUG_LEVEL0, "stripe_writev_ecc(): Attempted write
>> past end of device\n");
>> +        kfree(data_buf);
>> +        return -EINVAL;
>> +    }
>> +    +    /* Check "to" and "len" alignment here */
>> +    if((to & (mtd->oobblock - 1)) || (total_len & (mtd->oobblock - 1)))
>> +    {
>> +    printk(KERN_ERR "stripe_writev_ecc(): Attempted write not
>> aligned data!\n");
>> +        kfree(data_buf);
>> +        return -EINVAL;
>> +    }
>> +    +    /* Setup start page. Notaligned data is not allowed for 
>> write_ecc.
>> */
>> +    page = ((int) to) / mtd->oobblock;
>> +    towrite = (page + 1) * mtd->oobblock - to;  /* aligned with
>> oobblock */
>> +    write_offset = to;
>> +    written = 0; +    /* Loop until all iovecs' data has been 
>> written */
>> +    len = 0;
>> +    while (len < total_len) {
>> +        bufstart = (u_char *)vecs->iov_base;
>> +        bufstart += written;
>> +        data_poi = bufstart;
>> +
>> +        /* If the given tuple is >= reet of page then
>> +         * write it out from the iov
>> +     */
>> +    if ( (vecs->iov_len-written) >= towrite) {       /* The fastest
>> case is to write data by int * blocksize */
>> +        ret = mtd->write_ecc(mtd, write_offset, towrite, &rl_wr,
>> data_poi, eccbuf, oobsel);
>> +        if(ret)
>> +            break;
>> +        len += rl_wr;
>> +            page ++;
>> +            write_offset = page * mtd->oobblock;
>> +            towrite = mtd->oobblock;
>> +            written += towrite;
>> +            if(vecs->iov_len  == written) {
>> +                vecs ++;
>> +                written = 0;
>> +            }
>> +        +        if(eccbuf)
>> +        eccbuf += mtd->oobavail;
>> +      }
>> +      else +      {
>> +          cnt = 0;
>> +        while(cnt < towrite ) {
>> +            data_buf[cnt++] = ((u_char *)
>> vecs->iov_base)[written++];
>> +                if(vecs->iov_len == written )
>> +                {
>> +            if((cnt+len) == total_len )
>> +                    break;
>> +                    vecs ++;
>> +                written = 0;
>> +        }
>> +        }
>> +        data_poi = data_buf;
>> +        ret = mtd->write_ecc(mtd, write_offset, cnt, &rl_wr,
>> data_poi, eccbuf, oobsel);
>> +        if (ret)
>> +            break;
>> +        len += rl_wr;
>> +            page ++;
>> +        write_offset = page * mtd->oobblock;
>> +        towrite = mtd->oobblock;
>> +        +        if(eccbuf)
>> +        eccbuf += mtd->oobavail;
>> +      }
>> +    }
>> +
>> +    if(retlen)
>> +    *retlen = len;
>> +    kfree(data_buf);
>> +    +    DEBUG(MTD_DEBUG_LEVEL2, "<== stripe_writev_ecc()\n");
>> +
>> +    return ret;
>> +}
>> +
>> +
>> +static void
>> +stripe_erase_callback(struct erase_info *instr)
>> +{
>> +    wake_up((wait_queue_head_t *) instr->priv);
>> +}
>> +
>> +static int
>> +stripe_dev_erase(struct mtd_info *mtd, struct erase_info *erase)
>> +{
>> +    int err;
>> +    wait_queue_head_t waitq;
>> +    DECLARE_WAITQUEUE(wait, current);
>> +
>> +    init_waitqueue_head(&waitq);
>> +
>> +    erase->mtd = mtd;
>> +    erase->callback = stripe_erase_callback;
>> +    erase->priv = (unsigned long) &waitq;
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_dev_erase(): addr=0x%08x,
>> len=%d\n", erase->addr, erase->len);
>> +
>> +    /*
>> +     * FIXME: Allow INTERRUPTIBLE. Which means
>> +     * not having the wait_queue head on the stack.
>> +     */
>> +    err = mtd->erase(mtd, erase);
>> +    if (!err)
>> +    {
>> +    set_current_state(TASK_UNINTERRUPTIBLE);
>> +    add_wait_queue(&waitq, &wait);
>> +    if (erase->state != MTD_ERASE_DONE
>> +        && erase->state != MTD_ERASE_FAILED)
>> +        schedule();
>> +    remove_wait_queue(&waitq, &wait);
>> +    set_current_state(TASK_RUNNING);
>> +
>> +    err = (erase->state == MTD_ERASE_FAILED) ? -EIO : 0;
>> +    }
>> +    return err;
>> +}
>> +
>> +static int
>> +stripe_erase(struct mtd_info *mtd, struct erase_info *instr)
>> +{
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int i, err;
>> +    struct mtd_stripe_erase_bounds *erase_bounds;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to erase
>> (bytes) */
>> +    size_t subdev_len;            /* data size to be erased at
>> this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left;            /* total data size left to be
>> erased (bytes) */
>> +    size_t len_done;            /* total data size erased */
>> +    u_int32_t from;
>> +
>> +    struct mtd_stripe_op *ops;        /* operations array (one per
>> thread) */
>> +    u_int32_t size;            /* amount of memory to be
>> allocated for thread operations */
>> +    u_int32_t queue_size;
>> +
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_earse(): addr=0x%08x, len=%d\n",
>> instr->addr, instr->len);
>> +   
>> +    if(!(mtd->flags & MTD_WRITEABLE))
>> +    return -EROFS;
>> +
>> +    if(instr->addr > stripe->mtd.size)
>> +    return -EINVAL;
>> +
>> +    if(instr->len + instr->addr > stripe->mtd.size)
>> +    return -EINVAL;
>> +
>> +    /*
>> +     * Check for proper erase block alignment of the to-be-erased area.
>> +     */
>> +    if(!stripe->mtd.numeraseregions)
>> +    {
>> +    /* striped device has uniform erase block size */
>> +    if(instr->addr & (stripe->mtd.erasesize - 1))
>> +        return -EINVAL;
>> +    if(instr->len & (stripe->mtd.erasesize - 1))
>> +        return -EINVAL;
>> +    }
>> +    else
>> +    {
>> +    /* we should not get here */
>> +    return -EINVAL;
>> +    }
>> +
>> +    instr->fail_addr = 0xffffffff;
>> +
>> +    /* allocate memory for multithread operations */
>> +    queue_size = 1;    /* queue size for erase opration is 1 */
>> +    size = stripe->num_subdev *
>> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
>> +    ops = kmalloc(size, GFP_KERNEL);
>> +    if(!ops)
>> +    {
>> +    printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
>> +    return -ENOMEM;
>> +    }
>> +   
>> +    memset(ops, 0, size);
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +        ops[i].opcode = MTD_STRIPE_OPCODE_ERASE;
>> +    ops[i].caller_id = 0;             /* TBD */
>> +    init_MUTEX_LOCKED(&ops[i].sem);        /* mutex is locked here.
>> to be unlocked by device thread */
>> +    //ops[i].status = 0;            /* TBD */
>> +    ops[i].fail_addr = 0xffffffff;
>> +
>> +    INIT_LIST_HEAD(&ops[i].subops.list);    /* initialize
>> suboperation list head */
>> +
>> +    ops[i].subops.ops_num = 0;        /* to be increased later
>> here */
>> +    ops[i].subops.ops_num_max = queue_size;    /* total number of
>> suboperations can be stored in the array */
>> +    ops[i].subops.ops_array = (struct subop *)((char *)(ops +
>> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
>> +    }
>> +   
>> +    len_left = instr->len;
>> +    len_done = 0;
>> +    from = instr->addr;
>> +   
>> +    /* allocate memory for erase boundaries for all subdevices */
>> +    erase_bounds = kmalloc(stripe->num_subdev * sizeof(struct
>> mtd_stripe_erase_bounds), GFP_KERNEL);
>> +    if(!erase_bounds)
>> +    {
>> +    kfree(ops);
>> +    return -ENOMEM;
>> +    }
>> +    memset(erase_bounds, 0, sizeof(struct mtd_stripe_erase_bounds) *
>> stripe->num_subdev);
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(from >= stripe->subdev_last_offset[i-1])
>> +    {
>> +        dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((from - stripe->subdev_last_offset[i - 1])
>> / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((from - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) % dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (from / stripe->interleave_size) / dev_count;
>> +    subdev_number = (from / stripe->interleave_size) % dev_count;
>> +    }
>> +
>> +    /* Should by optimized for erase op */
>> +    subdev_offset_low = from % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* Add/extend block-to-be erased */
>> +    if(!erase_bounds[subdev_number].need_erase)
>> +    {
>> +    erase_bounds[subdev_number].need_erase = 1;
>> +    erase_bounds[subdev_number].addr = subdev_offset_low;
>> +    }
>> +    erase_bounds[subdev_number].len += subdev_len;
>> +    len_left -= subdev_len;
>> +    len_done += subdev_len;
>> +   
>> +    if(from + len_done >= stripe->subdev_last_offset[stripe->num_subdev
>> - dev_count])
>> +    dev_count--;
>> +       
>> +    while(len_left > 0 && dev_count > 0)
>> +    {
>> +    subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size; /* can by optimized for erase op*/
>> +   
>> +    /* Add/extend block-to-be erased */
>> +    if(!erase_bounds[subdev_number].need_erase)
>> +    {
>> +        erase_bounds[subdev_number].need_erase = 1;
>> +        erase_bounds[subdev_number].addr = subdev_offset *
>> stripe->interleave_size;
>> +    }
>> +    erase_bounds[subdev_number].len += subdev_len;
>> +    len_left -= subdev_len;
>> +    len_done += subdev_len;
>> +
>> +        DEBUG(MTD_DEBUG_LEVEL3, "stripe_erase(): device = %d, addr =
>> 0x%08x, len = %d\n", subdev_number, erase_bounds[subdev_number].addr,
>> erase_bounds[subdev_number].len);
>> +
>> +    if(from + len_done >=
>> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
>> +        dev_count--;
>> +    }
>> +       
>> +    /* now do the erase: */
>> +    err = 0;
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    if(erase_bounds[i].need_erase)
>> +    {
>> +        if (!(stripe->subdev[i]->flags & MTD_WRITEABLE))
>> +        {
>> +        err = -EROFS;
>> +        break;
>> +        }
>> +        +        stripe_add_subop(&ops[i], erase_bounds[i].addr,
>> erase_bounds[i].len, (u_char *)instr, NULL);
>> +    }
>> +    }
>> +       
>> +    /* Push operation queues into the corresponding threads */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +        if(erase_bounds[i].need_erase)
>> +    {
>> +        stripe_add_op(&stripe->sw_threads[i], &ops[i]);
>> +        +            /* set original operation priority */
>> +        ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
>> +            stripe_set_write_thread_prio(&stripe->sw_threads[i]);
>> +        +        up(&stripe->sw_threads[i].sw_thread_wait);
>> +    }
>> +    }
>> +   
>> +    /* wait for all suboperations completed and check status */
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +        if(erase_bounds[i].need_erase)
>> +    {
>> +        down(&ops[i].sem);
>> +       
>> +        /* set error if one of operations has failed */
>> +        if(ops[i].status)
>> +        {
>> +        err = ops[i].status;
>> +
>> +        /* FIX ME: For now this adddres shows address
>> +         * at the last failed subdevice,
>> +         * but not at the "super" device */
>> +        if(ops[i].fail_addr != 0xffffffff)
>> +            instr->fail_addr = ops[i].fail_addr; +        }
>> +                       
>> +        instr->state = ops[i].state;
>> +    }
>> +    }
>> +
>> +    /* Deallocate all memory before exit */
>> +    kfree(erase_bounds);
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    stripe_destroy_op(&ops[i]);
>> +    }
>> +    kfree(ops);
>> +
>> +    if(err)
>> +    return err;
>> +
>> +    if(instr->callback)
>> +        instr->callback(instr);
>> +    return 0;
>> +}
>> +
>> +static int
>> +stripe_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
>> +{
>> +    u_int32_t ofs_loc = (u_int32_t)ofs;    /* we can do this since
>> whole MTD size in current implementation has u_int32_t type */
>> +   
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to lock
>> (bytes). used for "first" probably unaligned with erasesize data block
>> */
>> +    size_t subdev_len;            /* data size to be locked @
>> subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to lock left
>> (bytes) */
>> +   
>> +    size_t retlen = 0;
>> +    struct mtd_stripe_erase_bounds *erase_bounds;
>> +
>> +    /* Check whole striped device bounds here */
>> +    if(ofs_loc + len > mtd->size)
>> +    return err;
>> +
>> +    /* allocate memory for lock boundaries for all subdevices */
>> +    erase_bounds = kmalloc(stripe->num_subdev * sizeof(struct
>> mtd_stripe_erase_bounds), GFP_KERNEL);
>> +    if(!erase_bounds)
>> +    return -ENOMEM;
>> +    memset(erase_bounds, 0, sizeof(struct mtd_stripe_erase_bounds) *
>> stripe->num_subdev);
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(ofs_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +        dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((ofs_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((ofs_loc - stripe->subdev_last_offset[i
>> - 1]) / stripe->interleave_size) % dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (ofs_loc / stripe->interleave_size) / dev_count;
>> +    subdev_number = (ofs_loc / stripe->interleave_size) % dev_count;
>> +    }
>> +
>> +    subdev_offset_low = ofs_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +
>> +    /* Add/extend block-to-be locked */
>> +    if(!erase_bounds[subdev_number].need_erase)
>> +    {
>> +    erase_bounds[subdev_number].need_erase = 1;
>> +    erase_bounds[subdev_number].addr = subdev_offset_low;
>> +    }
>> +    erase_bounds[subdev_number].len += subdev_len;
>> +
>> +    retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    if(ofs + retlen >= stripe->subdev_last_offset[stripe->num_subdev -
>> dev_count])
>> +    dev_count--;
>> +   
>> +    while(len_left > 0 && dev_count > 0)
>> +    {
>> +    subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +       
>> +    /* Add/extend block-to-be locked */
>> +    if(!erase_bounds[subdev_number].need_erase)
>> +    {
>> +        erase_bounds[subdev_number].need_erase = 1;
>> +        erase_bounds[subdev_number].addr = subdev_offset *
>> stripe->interleave_size;
>> +    }
>> +    erase_bounds[subdev_number].len += subdev_len;
>> +
>> +    retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +       
>> +    if(ofs + retlen >= stripe->subdev_last_offset[stripe->num_subdev
>> - dev_count])
>> +        dev_count--;
>> +    }
>> +
>> +    /* now do lock */
>> +    err = 0;
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    if(erase_bounds[i].need_erase)
>> +    {
>> +        if (stripe->subdev[i]->lock)
>> +        {
>> +              err = stripe->subdev[i]->lock(stripe->subdev[i],
>> erase_bounds[i].addr, erase_bounds[i].len);
>> +           if(err)
>> +            break;
>> +        };       +    }
>> +    }
>> +
>> +    /* Free allocated memory here */
>> +    kfree(erase_bounds);
>> +   
>> +    return err;
>> +}
>> +
>> +static int
>> +stripe_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
>> +{
>> +    u_int32_t ofs_loc = (u_int32_t)ofs;    /* we can do this since
>> whole MTD size in current implementation has u_int32_t type */
>> +   
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to unlock
>> (bytes). used for "first" probably unaligned with erasesize data block
>> */
>> +    size_t subdev_len;            /* data size to be unlocked @
>> subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = len;        /* total data size to unlock
>> left (bytes) */
>> +   
>> +    size_t retlen = 0;
>> +    struct mtd_stripe_erase_bounds *erase_bounds;
>> +
>> +    /* Check whole striped device bounds here */
>> +    if(ofs_loc + len > mtd->size)
>> +    return err;
>> +
>> +    /* allocate memory for unlock boundaries for all subdevices */
>> +    erase_bounds = kmalloc(stripe->num_subdev * sizeof(struct
>> mtd_stripe_erase_bounds), GFP_KERNEL);
>> +    if(!erase_bounds)
>> +    return -ENOMEM;
>> +    memset(erase_bounds, 0, sizeof(struct mtd_stripe_erase_bounds) *
>> stripe->num_subdev);
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(ofs_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +        dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((ofs_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((ofs_loc - stripe->subdev_last_offset[i
>> - 1]) / stripe->interleave_size) % dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (ofs_loc / stripe->interleave_size) / dev_count;
>> +    subdev_number = (ofs_loc / stripe->interleave_size) % dev_count;
>> +    }
>> +
>> +    subdev_offset_low = ofs_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +
>> +    /* Add/extend block-to-be unlocked */
>> +    if(!erase_bounds[subdev_number].need_erase)
>> +    {
>> +    erase_bounds[subdev_number].need_erase = 1;
>> +    erase_bounds[subdev_number].addr = subdev_offset_low;
>> +    }
>> +    erase_bounds[subdev_number].len += subdev_len;
>> +
>> +    retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +    if(ofs + retlen >= stripe->subdev_last_offset[stripe->num_subdev -
>> dev_count])
>> +    dev_count--;
>> +   
>> +    while(len_left > 0 && dev_count > 0)
>> +    {
>> +    subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +       
>> +    /* Add/extend block-to-be unlocked */
>> +    if(!erase_bounds[subdev_number].need_erase)
>> +    {
>> +        erase_bounds[subdev_number].need_erase = 1;
>> +        erase_bounds[subdev_number].addr = subdev_offset *
>> stripe->interleave_size;
>> +    }
>> +    erase_bounds[subdev_number].len += subdev_len;
>> +
>> +    retlen += subdev_len;
>> +    len_left -= subdev_len;
>> +       
>> +    if(ofs + retlen >= stripe->subdev_last_offset[stripe->num_subdev
>> - dev_count])
>> +        dev_count--;
>> +    }
>> +
>> +    /* now do unlock */
>> +    err = 0;
>> +    for(i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    if(erase_bounds[i].need_erase)
>> +    {
>> +        if (stripe->subdev[i]->unlock)
>> +        {
>> +           err = stripe->subdev[i]->unlock(stripe->subdev[i],
>> erase_bounds[i].addr, erase_bounds[i].len);
>> +           if(err)
>> +             break;
>> +        };       +    }
>> +    }
>> +
>> +    /* Free allocated memory here */
>> +    kfree(erase_bounds);
>> +   
>> +    return err;
>> +}
>> +
>> +static void
>> +stripe_sync(struct mtd_info *mtd)
>> +{
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int i;
>> +
>> +    for (i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    struct mtd_info *subdev = stripe->subdev[i];
>> +    if (subdev->sync)
>> +         subdev->sync(subdev);
>> +    }
>> +}
>> +
>> +static int
>> +stripe_suspend(struct mtd_info *mtd)
>> +{
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int i, rc = 0;
>> +
>> +    for (i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    struct mtd_info *subdev = stripe->subdev[i];
>> +    if (subdev->suspend)
>> +    {
>> +       if ((rc = subdev->suspend(subdev)) < 0)
>> +           return rc;
>> +    };       +    }
>> +    return rc;
>> +}
>> +
>> +static void
>> +stripe_resume(struct mtd_info *mtd)
>> +{
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int i;
>> +
>> +    for (i = 0; i < stripe->num_subdev; i++)
>> +    {
>> +    struct mtd_info *subdev = stripe->subdev[i];
>> +    if (subdev->resume)
>> +         subdev->resume(subdev);
>> +    }
>> +}
>> +
>> +static int
>> +stripe_block_isbad(struct mtd_info *mtd, loff_t ofs)
>> +{
>> +    u_int32_t from_loc = (u_int32_t)ofs;    /* we can do this since
>> whole MTD size in current implementation has u_int32_t type */
>> +   
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int res = 0;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned with erasesize data block
>> */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = mtd->oobblock;    /* total data size to 
>> read/write
>> left (bytes) */
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_block_isbad(): offset = 0x%08x\n",
>> from_loc);
>> +
>> +    from_loc = (from_loc / mtd->oobblock) * mtd->oobblock;    /* align
>> offset here */
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(from_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +            dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((from_loc -
>> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
>> dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (from_loc / stripe->interleave_size) /
>> dev_count;
>> +    subdev_number = (from_loc / stripe->interleave_size) %
>> dev_count;
>> +    }
>> +
>> +    subdev_offset_low = from_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* check block on subdevice is bad here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_isbad(): device = %d, offset
>> = 0x%08x\n", subdev_number, subdev_offset_low);
>> +    res =
>> stripe->subdev[subdev_number]->block_isbad(stripe->subdev[subdev_number]
>> , subdev_offset_low);
>> +    if(!res)
>> +    {
>> +    len_left -= subdev_len;
>> +    from_loc += subdev_len;
>> +    if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev -
>> dev_count])
>> +            dev_count--;
>> +    }
>> +       
>> +    while(!res && len_left > 0 && dev_count > 0)
>> +    {
>> +        subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +
>> +        /* check block on subdevice is bad here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_isbad(): device = %d,
>> offset = 0x%08x\n", subdev_number, subdev_offset *
>> stripe->interleave_size);
>> +    res =
>> stripe->subdev[subdev_number]->block_isbad(stripe->subdev[subdev_number]
>> , subdev_offset * stripe->interleave_size);
>> +    if(res)
>> +    {
>> +        break;
>> +    }
>> +    else
>> +    {
>> +        len_left -= subdev_len;
>> +        from_loc += subdev_len;
>> +        if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev
>> - dev_count])
>> +        dev_count--;
>> +    }
>> +    }
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "<== stripe_block_isbad()\n");
>> +    return res;
>> +}
>> +
>> +/* returns 0 - success */
>> +static int
>> +stripe_block_markbad(struct mtd_info *mtd, loff_t ofs)
>> +{
>> +    u_int32_t from_loc = (u_int32_t)ofs;    /* we can do this since
>> whole MTD size in current implementation has u_int32_t type */
>> +   
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int err = -EINVAL;
>> +    int i;
>> +
>> +    u_int32_t subdev_offset;        /* equal size subdevs offset
>> (interleaved block size count)*/
>> +    u_int32_t subdev_number;        /* number of current subdev */
>> +    u_int32_t subdev_offset_low;    /* subdev offset to read/write
>> (bytes). used for "first" probably unaligned with erasesize data block
>> */
>> +    size_t subdev_len;            /* data size to be read/written
>> from/to subdev at this turn (bytes) */
>> +    int dev_count;            /* equal size subdev count */
>> +    size_t len_left = mtd->oobblock;    /* total data size to 
>> read/write
>> left (bytes) */
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_block_markbad(): offset =
>> 0x%08x\n", from_loc);
>> +
>> +    from_loc = (from_loc / mtd->oobblock) * mtd->oobblock;    /* align
>> offset here */
>> +   
>> +    /* Locate start position and corresponding subdevice number */
>> +    subdev_offset = 0;
>> +    subdev_number = 0;
>> +    dev_count = stripe->num_subdev;
>> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
>> +    {
>> +    if(from_loc >= stripe->subdev_last_offset[i-1])
>> +    {
>> +            dev_count = stripe->num_subdev - i; /* get "equal size"
>> devices count */
>> +        subdev_offset = stripe->subdev[i - 1]->size /
>> stripe->interleave_size - 1;
>> +        subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
>> 1]) / stripe->interleave_size) / dev_count;
>> +        subdev_number = i + ((from_loc -
>> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
>> dev_count;
>> +        break;
>> +    }
>> +    }
>> +   
>> +    if(subdev_offset == 0)
>> +    {
>> +    subdev_offset = (from_loc / stripe->interleave_size) /
>> dev_count;
>> +    subdev_number = (from_loc / stripe->interleave_size) %
>> dev_count;
>> +    }
>> +
>> +    subdev_offset_low = from_loc % stripe->interleave_size;
>> +    subdev_len = (len_left < (stripe->interleave_size -
>> subdev_offset_low)) ? len_left : (stripe->interleave_size -
>> subdev_offset_low);
>> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
>> +   
>> +    /* check block on subdevice is bad here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_markbad(): device = %d,
>> offset = 0x%08x\n", subdev_number, subdev_offset_low);
>> +    err =
>> stripe->subdev[subdev_number]->block_markbad(stripe->subdev[subdev_numbe
>> r], subdev_offset_low);
>> +    if(!err)
>> +    {
>> +    len_left -= subdev_len;
>> +    from_loc += subdev_len;
>> +    if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev -
>> dev_count])
>> +            dev_count--;
>> +    }
>> +       
>> +    while(!err && len_left > 0 && dev_count > 0)
>> +    {
>> +        subdev_number++;
>> +    if(subdev_number >= stripe->num_subdev)
>> +    {
>> +        subdev_number = stripe->num_subdev - dev_count;
>> +        subdev_offset++;
>> +    }
>> +    subdev_len = (len_left < stripe->interleave_size) ? len_left :
>> stripe->interleave_size;
>> +
>> +        /* check block on subdevice is bad here */
>> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_markbad(): device = %d,
>> offset = 0x%08x\n", subdev_number, subdev_offset *
>> stripe->interleave_size);
>> +    err =
>> stripe->subdev[subdev_number]->block_markbad(stripe->subdev[subdev_numbe
>> r], subdev_offset * stripe->interleave_size);
>> +    if(err)
>> +    {
>> +        break;
>> +    }
>> +    else
>> +    {
>> +        len_left -= subdev_len;
>> +        from_loc += subdev_len;
>> +        if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev
>> - dev_count])
>> +        dev_count--;
>> +    }
>> +    }
>> +   
>> +    DEBUG(MTD_DEBUG_LEVEL2, "<== stripe_block_markbad()\n");
>> +    return err;
>> +}
>> +
>> +/*
>> + * This function constructs a virtual MTD device by interleaving
>> (striping)
>> + * num_devs MTD devices. A pointer to the new device object is
>> + * stored to *new_dev upon success. This function does _not_
>> + * register any devices: this is the caller's responsibility.
>> + */
>> +struct mtd_info *mtd_stripe_create(struct mtd_info *subdev[],    /*
>> subdevices to stripe */
>> +                   int num_devs,        /*
>> number of subdevices      */
>> +                   char *name,             /* name
>> for the new device   */
>> +                   int interleave_size)        /*
>> interleaving size (sanity check is required) */
>> +{               
>> +    int i,j;
>> +    size_t size;
>> +    struct mtd_stripe *stripe;
>> +    u_int32_t curr_erasesize;
>> +    int sort_done = 0;
>> +   
>> +    printk(KERN_NOTICE "Striping MTD devices:\n");
>> +    for (i = 0; i < num_devs; i++)
>> +        printk(KERN_NOTICE "(%d): \"%s\"\n", i, subdev[i]->name);
>> +    printk(KERN_NOTICE "into device \"%s\"\n", name);
>> +   
>> +    /* check if trying to stripe same device */
>> +    for(i = 0; i < num_devs; i++)
>> +    {
>> +        for(j = i; j < num_devs; j++)
>> +    {
>> +        if(i != j && !(strcmp(subdev[i]->name,subdev[j]->name)))
>> +        {
>> +        printk(KERN_ERR "MTD Stripe failed. The same subdevice
>> names were found.\n");
>> +        return NULL;
>> +        }
>> +    }
>> +    }
>> +
>> +    /* allocate the device structure */
>> +    size = SIZEOF_STRUCT_MTD_STRIPE(num_devs);
>> +    stripe = kmalloc(size, GFP_KERNEL);
>> +    if (!stripe)
>> +    {
>> +        printk(KERN_ERR "mtd_stripe_create(): memory allocation
>> error\n");
>> +        return NULL;
>> +    }
>> +    memset(stripe, 0, size);
>> +    stripe->subdev = (struct mtd_info **) (stripe + 1);
>> +    stripe->subdev_last_offset = (u_int32_t *) ((char *)(stripe + 1) +
>> num_devs * sizeof(struct mtd_info *));
>> +    stripe->sw_threads = (struct mtd_sw_thread_info *)((char *)(stripe
>> + 1) + num_devs * sizeof(struct mtd_info *) + num_devs *
>> sizeof(u_int32_t));
>> +   
>> +    /*
>> +     * Set up the new "super" device's MTD object structure, check for
>> +     * incompatibilites between the subdevices.
>> +     */
>> +    stripe->mtd.type = subdev[0]->type;
>> +    stripe->mtd.flags = subdev[0]->flags;
>> +    stripe->mtd.size = subdev[0]->size;
>> +    stripe->mtd.erasesize = subdev[0]->erasesize;
>> +    stripe->mtd.oobblock = subdev[0]->oobblock;
>> +    stripe->mtd.oobsize = subdev[0]->oobsize;
>> +    stripe->mtd.oobavail = subdev[0]->oobavail;
>> +    stripe->mtd.ecctype = subdev[0]->ecctype;
>> +    stripe->mtd.eccsize = subdev[0]->eccsize;
>> +    if (subdev[0]->read_ecc)
>> +    stripe->mtd.read_ecc = stripe_read_ecc;
>> +    if (subdev[0]->write_ecc)
>> +        stripe->mtd.write_ecc = stripe_write_ecc;
>> +    if (subdev[0]->read_oob)
>> +    stripe->mtd.read_oob = stripe_read_oob;
>> +    if (subdev[0]->write_oob)
>> +    stripe->mtd.write_oob = stripe_write_oob;
>> +
>> +    stripe->subdev[0] = subdev[0];
>> +
>> +    for(i = 1; i < num_devs; i++)
>> +    {
>> +    /* +     * Check device compatibility,
>> +     */
>> +    if(stripe->mtd.type != subdev[i]->type)
>> +    {
>> +        kfree(stripe);
>> +        printk(KERN_ERR "mtd_stripe_create(): incompatible device
>> type on \"%s\"\n",
>> +                subdev[i]->name);
>> +        return NULL;
>> +    }
>> +   
>> +    /*
>> +     * Check MTD flags
>> +     */
>> +    if(stripe->mtd.flags != subdev[i]->flags)
>> +    {
>> +        /*
>> +         * Expect all flags to be
>> +         * equal on all subdevices.
>> +         */
>> +        kfree(stripe);
>> +        printk(KERN_ERR "mtd_stripe_create(): incompatible device
>> flags on \"%s\"\n",
>> +                subdev[i]->name);
>> +        return NULL;
>> +    }
>> +   
>> +    stripe->mtd.size += subdev[i]->size;
>> +   
>> +    /*
>> +     * Check OOB and ECC data
>> +     */
>> +    if (stripe->mtd.oobblock   !=  subdev[i]->oobblock ||
>> +        stripe->mtd.oobsize    !=  subdev[i]->oobsize ||
>> +        stripe->mtd.oobavail   !=  subdev[i]->oobavail ||
>> +        stripe->mtd.ecctype    !=  subdev[i]->ecctype ||
>> +        stripe->mtd.eccsize    !=  subdev[i]->eccsize ||
>> +        !stripe->mtd.read_ecc  != !subdev[i]->read_ecc ||
>> +        !stripe->mtd.write_ecc != !subdev[i]->write_ecc ||
>> +        !stripe->mtd.read_oob  != !subdev[i]->read_oob ||
>> +        !stripe->mtd.write_oob != !subdev[i]->write_oob)
>> +    {
>> +        kfree(stripe);
>> +        printk(KERN_ERR "mtd_stripe_create(): incompatible OOB or
>> ECC data on \"%s\"\n",
>> +                subdev[i]->name);
>> +        return NULL;
>> +    }
>> +    stripe->subdev[i] = subdev[i];
>> +    }
>> +
>> +    stripe->num_subdev = num_devs;
>> +    stripe->mtd.name = name;
>> +
>> +    /*
>> +     * Main MTD routines
>> +     */
>> +    stripe->mtd.erase = stripe_erase;
>> +    stripe->mtd.read = stripe_read;
>> +    stripe->mtd.write = stripe_write;
>> +    stripe->mtd.sync = stripe_sync;
>> +    stripe->mtd.lock = stripe_lock;
>> +    stripe->mtd.unlock = stripe_unlock;
>> +    stripe->mtd.suspend = stripe_suspend;
>> +    stripe->mtd.resume = stripe_resume;
>> +
>> +#ifdef MTD_PROGRAM_REGIONS
>> +    /* Montavista patch for Sibley support detected     */
>> +    if((stripe->mtd.flags & MTD_PROGRAM_REGIONS) ||
>> (stripe->mtd.flags & MTD_ECC))   
>> +        stripe->mtd.writev = stripe_writev;
>> +#else
>> +    if(stripe->mtd.flags & MTD_ECC)   
>> +        stripe->mtd.writev = stripe_writev;
>> +#endif
>> +
>> +    /* not sure about that case. probably should be used not only for
>> NAND */
>> +    if(stripe->mtd.type == MTD_NANDFLASH)
>> +    stripe->mtd.writev_ecc = stripe_writev_ecc;
>> +    +    if(subdev[0]->block_isbad)
>> +    stripe->mtd.block_isbad = stripe_block_isbad;
>> +   
>> +    if(subdev[0]->block_markbad)
>> +    stripe->mtd.block_markbad = stripe_block_markbad;
>> +
>> +    /*
>> +     * Create new device with uniform erase size.
>> +     */
>> +    curr_erasesize = subdev[0]->erasesize;
>> +    for (i = 0; i < num_devs; i++)
>> +    {
>> +        curr_erasesize = lcm(curr_erasesize, subdev[i]->erasesize);
>> +    }
>> +   
>> +    /* Check if erase size found is valid */
>> +    if(curr_erasesize <= 0)
>> +    {
>> +        kfree(stripe);
>> +        printk(KERN_ERR "mtd_stripe_create(): Can't find lcm of
>> subdevice erase sizes\n");
>> +        return NULL;
>> +    }
>> +   
>> +    /* store erasesize lcm */
>> +    stripe->erasesize_lcm = curr_erasesize;
>> +   
>> +    /* simple erase size estimate. TBD better approach */
>> +    curr_erasesize *= num_devs;
>> +   
>> +    /* Check interleave size validity here */
>> +    if(curr_erasesize % interleave_size)
>> +    {
>> +    kfree(stripe);
>> +    printk(KERN_ERR "mtd_stripe_create(): Wrong interleave size\n");
>> +    return NULL;
>> +    }
>> +    stripe->interleave_size = interleave_size;
>> +   
>> +    stripe->mtd.erasesize = curr_erasesize;
>> +    stripe->mtd.numeraseregions = 0;
>> +    +    /* NAND specific */
>> +    if(stripe->mtd.type == MTD_NANDFLASH)
>> +    {
>> +        stripe->mtd.oobblock *= num_devs;
>> +    stripe->mtd.oobsize *= num_devs;
>> +        stripe->mtd.oobavail *= num_devs; /* oobavail is to be changed
>> later in stripe_merge_oobinfo() */
>> +    stripe->mtd.eccsize *= num_devs;
>> +    }
>> +
>> +#ifdef MTD_PROGRAM_REGIONS
>> +    /* Montavista patch for Sibley support detected     */
>> +    if(stripe->mtd.flags & MTD_PROGRAM_REGIONS)
>> +    stripe->mtd.oobblock *= num_devs;
>> +    else if(stripe->mtd.flags & MTD_ECC)
>> +    stripe->mtd.eccsize *= num_devs;
>> +#else
>> +    if(stripe->mtd.flags & MTD_ECC)
>> +    stripe->mtd.eccsize *= num_devs;
>> +#endif
>> +   
>> +    /* update (truncate) super device size in accordance with new
>> erasesize */
>> +    stripe->mtd.size = (stripe->mtd.size / stripe->mtd.erasesize) *
>> stripe->mtd.erasesize;
>> +   
>> +    /* Sort all subdevices by their size */
>> +    while(!sort_done)
>> +    {
>> +    sort_done = 1;
>> +    for(i=0; i < num_devs - 1; i++)
>> +    {
>> +        struct mtd_info *subdev = stripe->subdev[i];
>> +        if(subdev->size > stripe->subdev[i+1]->size)
>> +        {
>> +        stripe->subdev[i] = stripe->subdev[i+1];
>> +        stripe->subdev[i+1] = subdev;
>> +        sort_done = 0;
>> +        }
>> +    }
>> +    }
>> +   
>> +    /* Calculate last data offset for each striped device */
>> +    for (i = 0; i < num_devs; i++)
>> +        stripe->subdev_last_offset[i] = last_offset(stripe, i);
>> +
>> +    /* NAND specific */
>> +    if(stripe->mtd.type == MTD_NANDFLASH)
>> +    {
>> +    /* Fill oobavail with correct values here */
>> +    for (i = 0; i < num_devs; i++)
>> +        stripe->subdev[i]->oobavail =
>> stripe_get_oobavail(stripe->subdev[i]);
>> +
>> +        /* Sets new device oobinfo
>> +     * NAND flash check is performed inside stripe_merge_oobinfo()
>> +         * - this should be made after subdevices sorting done for
>> proper eccpos and oobfree positioning
>> +     * NOTE: there are some limitations with different size NAND
>> devices striping. all devices must have
>> +         * the same oobfree and eccpos maps */
>> +    if(stripe_merge_oobinfo(&stripe->mtd, subdev, num_devs))
>> +        {
>> +            kfree(stripe);
>> +            printk(KERN_ERR "mtd_stripe_create(): oobinfo merge has
>> failed\n");
>> +        return NULL;
>> +    }
>> +    }
>> +       
>> +    /* Create write threads */
>> +    for (i = 0; i < num_devs; i++)
>> +    {
>> +    if(stripe_start_write_thread(&stripe->sw_threads[i],
>> stripe->subdev[i]) < 0)
>> +    {
>> +        kfree(stripe);
>> +        return NULL;
>> +    }
>> +    }
>> +    return &stripe->mtd;
>> +}
>> +
>> +/* + * This function destroys an Striped MTD object
>> + */
>> +void mtd_stripe_destroy(struct mtd_info *mtd)
>> +{
>> +    struct mtd_stripe *stripe = STRIPE(mtd);
>> +    int i;
>> +   
>> +    if (stripe->mtd.numeraseregions)
>> +    /* we should not get here. so just in case. */
>> +    kfree(stripe->mtd.eraseregions);
>> +       
>> +    /* destroy writing threads */
>> +    for (i = 0; i < stripe->num_subdev; i++)
>> +    stripe_stop_write_thread(&stripe->sw_threads[i]);
>> +
>> +    kfree(stripe);
>> +}
>> +
>> +
>> +#ifdef CMDLINE_PARSER_STRIPE
>> +/*
>> + * MTD stripe init and cmdline parsing routines + */
>> +
>> +static int
>> +parse_cmdline_stripe_part(struct mtd_stripe_info *info, char *s)
>> +{
>> +    int ret = 0;
>> +    +    struct mtd_stripe_info *new_stripe = NULL;
>> +    unsigned int name_size;
>> +    char *subdev_name;
>> +    char *e;
>> +    int j;
>> +    +    DEBUG(MTD_DEBUG_LEVEL1, "parse_cmdline_stripe_part(): arg = 
>> %s\n",
>> s);
>> +    +    /* parse new striped device name and allocate stripe info 
>> structure
>> */
>> +    if(!(e = strchr(s,'(')) || (e == s))
>> +        return -EINVAL;
>> +        +    name_size = (unsigned int)(e - s);
>> +    new_stripe = kmalloc(sizeof(struct mtd_stripe_info) + name_size +
>> 1, GFP_KERNEL);
>> +    if(!new_stripe) {
>> +        printk(KERN_ERR "parse_cmdline_stripe_part(): memory allocation
>> error!\n");
>> +    return -ENOMEM;        +    }
>> +    memset(new_stripe,0,sizeof(struct mtd_stripe_info) + name_size +
>> 1);
>> +    new_stripe->name = (char *)(new_stripe + 1);
>> +
>> +    INIT_LIST_HEAD(&new_stripe->list);
>> +   
>> +    /* Store new device name */
>> +    strncpy(new_stripe->name, s, name_size);
>> +    s = e;
>> +       
>> +    while(*s != 0)
>> +    {
>> +        switch(*s)
>> +    {
>> +            case '(':
>> +        s++;
>> +            new_stripe->interleave_size = simple_strtoul(s,&s,10);
>> +            if(!new_stripe->interleave_size || *s != ')')
>> +            ret = -EINVAL;
>> +        else
>> +            s++;
>> +        break;
>> +        case ':':
>> +        case ',':
>> +        case '.':
>> +            // proceed with subdevice names
>> +        if((e = strchr(++s,',')))
>> +            name_size = (unsigned int)(e - s);
>> +        else if((e = strchr(s,'.')))    /* this delimeter is to
>> be used for insmod params */
>> +            name_size = (unsigned int)(e - s);
>> +        else
>> +            name_size = strlen(s);
>> +                +            subdev_name = kmalloc(name_size + 1, 
>> GFP_KERNEL);
>> +            if(!subdev_name)
>> +        {
>> +                printk(KERN_ERR "parse_cmdline_stripe_part(): memory
>> allocation error!\n");
>> +            ret = -ENOMEM;
>> +            break;
>> +            }
>> +        strncpy(subdev_name,s,name_size);
>> +        *(subdev_name + name_size) = 0;
>> +       
>> +        /* Set up and register striped MTD device */
>> +        down(&mtd_table_mutex);
>> +        for(j = 0; j < MAX_MTD_DEVICES; j++)
>> +        {
>> +            if(mtd_table[j] &&
>> !strcmp(subdev_name,mtd_table[j]->name))
>> +            {
>> +                new_stripe->devs[new_stripe->dev_num++] =
>> mtd_table[j];
>> +                break;
>> +            }
>> +        }
>> +        up(&mtd_table_mutex);
>> +               
>> +        kfree(subdev_name);
>> +       
>> +        if(j == MAX_MTD_DEVICES)
>> +            ret = -EINVAL;
>> +            +        s += name_size;
>> +            +            break;
>> +        default:
>> +            /* should not get here */
>> +        printk(KERN_ERR "stripe cmdline parse error\n");
>> +            ret = -EINVAL;
>> +            break;
>> +    };
>> +        +    if(ret)
>> +        break;
>> +    }
>> +    +    /* Check if all data parsed correctly. Sanity check. */
>> +    if(ret)
>> +    {
>> +        kfree(new_stripe);
>> +    }
>> +    else
>> +    {
>> +        list_add_tail(&new_stripe->list,&info->list);
>> +    DEBUG(MTD_DEBUG_LEVEL1, "Striped device %s parsed from
>> cmdline\n", new_stripe->name);
>> +    }
>> +    +    return ret;
>> +}
>> +
>> +/* cmdline format:
>> + * mtdstripe=stripe1(128):vol3,vol5;stripe2(128):vol8,vol9 */
>> +static int
>> +parse_cmdline_stripes(struct mtd_stripe_info *info, char *s)
>> +{
>> +    int ret = 0;
>> +    char *part;
>> +    char *e;
>> +    int cmdline_part_size;
>> +    +    struct list_head *pos, *q;
>> +    struct mtd_stripe_info *stripe_info;
>> +
>> +    while(*s)
>> +    {
>> +    if(!(e = strchr(s,';')))
>> +    {
>> +        ret = parse_cmdline_stripe_part(info,s);
>> +        break;
>> +    }
>> +    else
>> +    {
>> +        cmdline_part_size = (int)(e - s);
>> +        part = kmalloc(cmdline_part_size + 1, GFP_KERNEL);
>> +        if(!part)
>> +        {
>> +            printk(KERN_ERR "parse_cmdline_stripes(): memory
>> allocation error!\n");
>> +        ret = -ENOMEM;
>> +        break;
>> +        }
>> +        strncpy(part,s,cmdline_part_size);
>> +        *(part + cmdline_part_size) = 0;
>> +        ret = parse_cmdline_stripe_part(info,part);
>> +        kfree(part);
>> +        if(ret)
>> +        break;
>> +        s = e + 1;
>> +    }
>> +    }
>> +    +    if(ret)
>> +    {
>> +        /* free all alocated memory in case of error */
>> +        list_for_each_safe(pos, q, &info->list)    {
>> +        stripe_info = list_entry(pos, struct mtd_stripe_info, list);
>> +        list_del(&stripe_info->list);
>> +        kfree(stripe_info);
>> +    }
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +/* initializes striped MTD devices
>> + * to be called from mphysmap.c module or mtdstripe_init()
>> + */
>> +int
>> +mtd_stripe_init(void)
>> +{
>> +    static struct mtd_stripe_info *dev_info;
>> +    struct list_head *pos, *q;
>> +    +    struct mtd_info* mtdstripe_info;
>> +    +    INIT_LIST_HEAD(&info.list);
>> +    +    /* parse cmdline */
>> +    if(!cmdline)
>> +    return 0;
>> +
>> +    if(parse_cmdline_stripes(&info,cmdline))
>> +        return -EINVAL;
>> +
>> +    /* go through the list and create new striped devices */
>> +    list_for_each_safe(pos, q, &info.list) {
>> +        dev_info = list_entry(pos, struct mtd_stripe_info, list);
>> +   
>> +        mtdstripe_info = mtd_stripe_create(dev_info->devs,
>> dev_info->dev_num,
>> +                    dev_info->name,
>> dev_info->interleave_size);
>> +    if(!mtdstripe_info)
>> +    {
>> +        printk(KERN_ERR "mtd_stripe_init: mtd_stripe_create() error
>> creating \"%s\"\n", dev_info->name);
>> +        +        /* remove registered striped device info from the list
>> +         * free memory allocated by parse_cmdline_stripes()
>> +         */
>> +        list_del(&dev_info->list);
>> +        kfree(dev_info);
>> +        +        return -EINVAL;
>> +    }
>> +    else
>> +    {
>> +        if(add_mtd_device(mtdstripe_info))
>> +        {
>> +            printk(KERN_ERR "mtd_stripe_init: add_mtd_device() error
>> creating \"%s\"\n", dev_info->name);
>> +        mtd_stripe_destroy(mtdstripe_info);
>> +
>> +        /* remove registered striped device info from the list
>> +             * free memory allocated by parse_cmdline_stripes()
>> +             */
>> +        list_del(&dev_info->list);
>> +        kfree(dev_info);
>> +        +        return -EINVAL;
>> +        }
>> +        else
>> +        printk(KERN_ERR "Striped device \"%s\" has been created
>> (interleave size %d bytes)\n",
>> +            dev_info->name, dev_info->interleave_size);
>> +    }
>> +    }
>> +    +    return 0;    +}
>> +
>> +/* removes striped devices */
>> +int
>> +mtd_stripe_exit(void)
>> +{
>> +    static struct mtd_stripe_info *dev_info;
>> +    struct list_head *pos, *q;
>> +    struct mtd_info *old_mtd_info;
>> +    +    int j;
>> +    +    /* go through the list and remove striped devices */
>> +    list_for_each_safe(pos, q, &info.list) {
>> +        dev_info = list_entry(pos, struct mtd_stripe_info, list);
>> +   
>> +    down(&mtd_table_mutex);
>> +    for(j = 0; j < MAX_MTD_DEVICES; j++)
>> +    {
>> +        if(mtd_table[j] &&
>> !strcmp(dev_info->name,mtd_table[j]->name))
>> +        {
>> +        old_mtd_info = mtd_table[j];
>> +        up(&mtd_table_mutex); /* up here since del_mtd_device
>> down it */
>> +        del_mtd_device(mtd_table[j]);
>> +        down(&mtd_table_mutex);
>> +        mtd_stripe_destroy(old_mtd_info);
>> +            break;
>> +        }
>> +    }
>> +    up(&mtd_table_mutex);
>> +   
>> +    /* remove registered striped device info from the list
>> +     * free memory allocated by parse_cmdline_stripes()
>> +     */
>> +    list_del(&dev_info->list);
>> +    kfree(dev_info);
>> +    }
>> +    +    return 0;    +}
>> +
>> +EXPORT_SYMBOL(mtd_stripe_init);
>> +EXPORT_SYMBOL(mtd_stripe_exit);
>> +#endif
>> +
>> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
>> +#ifndef MODULE
>> +/* + * This is the handler for our kernel parameter, called from + * 
>> main.c::checksetup(). Note that we can not yet kmalloc() anything,
>> + * so we only save the commandline for later processing.
>> + *
>> + * This function needs to be visible for bootloaders.
>> + */
>> +int mtdstripe_setup(char *s)
>> +{
>> +    cmdline = s;
>> +    return 1;
>> +}
>> +
>> +__setup("mtdstripe=", mtdstripe_setup);
>> +#endif
>> +#endif
>> +
>> +EXPORT_SYMBOL(mtd_stripe_create);
>> +EXPORT_SYMBOL(mtd_stripe_destroy);
>> +
>> +#ifdef MODULE
>> +static int __init init_mtdstripe(void)
>> +{
>> +    cmdline = cmdline_parm;
>> +    if(cmdline)
>> +    mtd_stripe_init();
>> +   
>> +    return 0;
>> +}
>> +
>> +static void __exit exit_mtdstripe(void)
>> +{
>> +    if(cmdline)
>> +    mtd_stripe_exit();
>> +}
>> +
>> +module_init(init_mtdstripe);
>> +module_exit(exit_mtdstripe);
>> +#endif
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Alexander Belyakov <alexander.belyakov@intel.com>, Intel
>> Corporation");
>> +MODULE_DESCRIPTION("Generic support for striping of MTD devices");
>> diff -uNr a/include/linux/mtd/cfi_cpt.h b/include/linux/mtd/cfi_cpt.h
>> --- a/include/linux/mtd/cfi_cpt.h    1970-01-01 03:00:00.000000000
>> +0300
>> +++ b/include/linux/mtd/cfi_cpt.h    2006-03-16 12:34:38.000000000
>> +0300
>> @@ -0,0 +1,46 @@
>> +
>> +#ifndef __MTD_CFI_CPT_H__
>> +#define __MTD_CFI_CPT_H__
>> +
>> +struct cpt_thread_info {
>> +    struct task_struct *thread;
>> +    int cpt_cont;        /* continue flag */
>> +
>> +    struct semaphore cpt_startstop; /* thread start/stop semaphore */
>> +   
>> +    /* wait-for-operation semaphore,
>> +     * up by cpt_check_add,
>> +     * down by cpt_thread
>> +     */
>> +    struct semaphore cpt_wait;
>> +   
>> +    struct list_head list;    /* head of chip list */
>> +    spinlock_t list_lock;    /* lock to remove race conditions
>> +                 * while adding/removing chips
>> +                 * to/from the list */    +};
>> +
>> +struct cpt_check_desc {
>> +    struct list_head list;    /* per chip queue */
>> +    struct flchip *chip;
>> +    struct map_info *map;
>> +    map_word status_OK;
>> +    unsigned long cmd_adr;
>> +    unsigned long timeo;    /* timeout */
>> +    int task_prio;        /* task priority */
>> +    int wait;            /* if 0 - only one wait loop */
>> +    struct semaphore check_semaphore;
>> +    int success;        /* 1 - success, 0 - timeout, etc. */
>> +};
>> +
>> +struct cpt_chip {
>> +    struct list_head list;
>> +    struct flchip *chip;
>> +    struct list_head plist;    /* head of per chip op list */
>> +    spinlock_t list_lock;
>> +};
>> +
>> +int cpt_check_wait(struct cpt_thread_info* info, struct flchip *chip,
>> struct map_info *map, +            unsigned long cmd_adr, map_word 
>> status_OK, int
>> wait);
>> +
>> +#endif /* #ifndef __MTD_CFI_CPT_H__ */
>> diff -uNr a/include/linux/mtd/stripe.h b/include/linux/mtd/stripe.h
>> --- a/include/linux/mtd/stripe.h    1970-01-01 03:00:00.000000000
>> +0300
>> +++ b/include/linux/mtd/stripe.h    2006-03-16 12:34:38.000000000
>> +0300
>> @@ -0,0 +1,39 @@
>> +/*
>> + * MTD device striping layer definitions
>> + *
>> + * (C) 2005 Intel Corp.
>> + *
>> + * This code is GPL
>> + *
>> + *
>> + */
>> +
>> +#ifndef MTD_STRIPE_H
>> +#define MTD_STRIPE_H
>> +
>> +struct mtd_stripe_info {
>> +    struct list_head list;
>> +    char *name;                    /* new device
>> name */
>> +    int interleave_size;            /* interleave size */
>> +    int dev_num;                 /* number of devices to
>> be striped */
>> +    struct mtd_info* devs[MAX_MTD_DEVICES];    /* MTD device to be
>> striped */
>> +};
>> +
>> +struct mtd_info *mtd_stripe_create(
>> +    struct mtd_info *subdev[],  /* subdevices to stripe      */
>> +    int num_devs,               /* number of subdevices      */
>> +    char *name,                 /* name for the new device   */
>> +    int inteleave_size);      /* interleaving size         */
>> +
>> +
>> +struct mtd_info *mtd_stripe_create(struct mtd_info *subdev[],    /*
>> subdevices to stripe */
>> +                   int num_devs,        /*
>> number of subdevices      */
>> +                   char *name,             /* name
>> for the new device   */
>> +                   int interleave_size);    /*
>> interleaving size (sanity check is required) */
>> +void mtd_stripe_destroy(struct mtd_info *mtd);
>> +
>> +int mtd_stripe_init(void);
>> +int mtd_stripe_exit(void);
>> +
>> +#endif
>> +
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>
>>  
>>
