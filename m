Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta02.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qSjh-0002h7-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2002 05:46:09 +0000
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Wed, 27 Mar 2002 21:46:04 -0800 (PST)
From: Jim Zeus <zeusj@firstlinux.net>
To: David Woodhouse <dwmw2@infradead.org>,
	"David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Whats wrong with my jffs2?
Reply-To: zeusj@firstlinux.net
Message-Id: <20020328054604.BFC5D2755@sitemail.everyone.net>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


--- David Woodhouse <dwmw2@infradead.org> wrote:
>
>zeusj@firstlinux.net said:
>>     Can you tell me why only my mtd char device with even minor deivce
>> number works? and there is no such thing happened on my mtd block
>> device. 
>
>Did you run the MAKEDEV script or try to make your devices by hand? If you 
>did them by hand, did you do so without referring to Documentation/devices.txt?
>
>grep -A6 " 90 char" /usr/src/linux/Documentation/devices.txt 

Thanks, I have checked the devices.txt, so I got why the odd mtd "permission denied". But if the device nodes with major 31 ,mi 0-7 are ROM card (as the device.txt said),why my flash can works without nothing wrong? I think the minor number should be 8-15 , isnt it?

one more question
when I use jffs as the root filesystem, everything is ok, but when I use jffs2 (I remeber that you said its more stable than jffs:), I got a problem some message appears on my screen and the root filesystem is readonly (this never happened on jffs), the following is the message:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0014: 0x552f in
stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0018: 0x175e in
stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e001c: 0xcdf6 in
stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0020: 0xb7fb in
stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0024: 0x7615 in
stead

Further such events for this erase block will not be printed

VFS: Mounted root (jffs2 filesystem) readonly.

Freeing init memory: 40K

serial console detected.  Disabling virtual terminals.

init started:  BusyBox v0.60.2 (2002.02.24-07:14+0000) multi-call
mount: Mounting /dev/ram0 on / failed: No such device or address

mount: Mounting devpts on /dev/pts failed: Nh




BusyBox v0.60.2 (2002.02.24-07:25+0000) Built-in shell (msh)

Ee o-a


Processing /etc/profile... Done
#

Thank you very much!


Jim Zeus 


_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Run a small business? Then you need professional email like you@yourbiz.com from Everyone.net  http://www.everyone.net?tag
