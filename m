Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta05.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1783bA-0002Ey-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 19:34:04 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Wed, 15 May 2002 11:34:02 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: David Woodhouse <dwmw2@infradead.org>,
	"David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: misc question about MTD
Reply-To: zeusj@firstlinux.net
Message-Id: <20020515183403.3C15D2755@sitemail.everyone.net>
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

Hi, David

--- David Woodhouse <dwmw2@infradead.org> wrote:

>Strange. Is the flash completely erased? It should not be erased 
>automatically -- too many people attempt to mount the wrong flash 
>partition, and if you mount the partition that contains your bootloader you 
>will _not_ thank me for auto-erasing it.

Yes, its ok now , I erase the flash before mount it , then its ok:)


>I would strongly recommend you use JFFS2, not JFFS. I haven't looked at JFFS
>code for ages now, and I don't think anyone else is doing so either.

It is the second time you *strongly* recommend me use JFFS2:) 
ok, I tried it just now: I erased the flash, and I mount it(I do all these just like mount JFFS),but I got the message that I have meet before (in the last board I ported):
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020024: 0x2f0c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020028: 0x0001 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00020000 is not formatted. It will be erased

these messages above are my old friend, and I got some new ones:

Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes

so what does that means? I am losing the confidence to JFFS2 now:(

And when I am debugging the flash, I find something strange,you know, I wrote some debug message when debugging so when I "cp /usr/somefile /dev/mtd0",I got this:
# cp /usr/somefile /dev/mtd0
MTD_open
ZEUS:begin of mtd_open
ZEUS:begin of get_mtd_device
ZEUS:begin of __get_mtd_device
ZEUS:end of __get_mtd_device
ZEUS:end of get_mtd_device
ZEUS:end of mtd_open
MTD_write
ZEUS:begin of mtd_write
ZEUS:begin of cfi_amdstd_write
ZEUS:end of cfi_amdstd_write
ZEUS:end of mtd_write
MTD_close
ZEUS:begin of mtd_close
ZEUS:begin of put_mtd_device
ZEUS:end of put_mtd_device
ZEUS:end of mtd_close

the "begin of" and "end of" message is printed at the begin and end of functions,
when I delete the printk() in cfi_amdstd_write() to prevent the "ZEUS:begin/end of cfi_amdstd_write" to be shown(I just do it, nothing else), I cant accomplish the same thing that I have done before:
# cp /usr/somefile /dev/mtd0
MTD_open
ZEUS:begin of mtd_open
ZEUS:begin of get_mtd_device
ZEUS:begin of __get_mtd_device
ZEUS:end of __get_mtd_device
ZEUS:end of get_mtd_device
ZEUS:end of mtd_open
MTD_write
ZEUS:begin of mtd_write
Last[3] is 9da5, datum is 6246
/dev/mtd0: I/O error
MTD_close
ZEUS:begin of mtd_close
ZEUS:begin of put_mtd_device
ZEUS:end of put_mtd_device
ZEUS:end of mtd_close
#

I know the "Last[3] is 9da5, datum is 6246" message is to tell me that what should be written is wrongly different from what be read from flash,its a sanity check,but why a printk() can affects the Flash write?

Thanks in advance

Jim Zeus


_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
