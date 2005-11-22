Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EegMM-0006v0-Sw
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 17:11:33 -0500
Message-ID: <438397B8.5060205@mvista.com>
Date: Tue, 22 Nov 2005 14:12:08 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
References: <20051122151042.57202.qmail@web26306.mail.ukl.yahoo.com>
In-Reply-To: <20051122151042.57202.qmail@web26306.mail.ukl.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question regarding mounting CRAMFS and JFFS2 from a single flash
 chip on ucLinux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sreecharan Sivadevuni wrote:
> I am using an arm processor based development board on
> which there is an Intel E28F320(NOR) flash chip which
> is of 4MB. ...
> my flash is getting detected on 'cfi_probe'. But when
> I am trying to mount JFFS2(or trying to write to )
> '/dev/mtdblock0'(at 0x00600000) I am getting an error
> that it is a readonly file system. The error as it is
> printed on console is "-EROFS. Is the Sector Locked ?"
> This is coming from file 'cfi_cmdset_0001.c' from
> function 'do_erase_one_block'. This is despite that I
> have made my JFFS2 partition as MTD_WRITEB_WRITEABLE
> in 'physmem.c' file.

Your flash chips probably power up with all blocks locked, and blocks to 
be written must be unlocked first.  Can use flash_unlock /dev/mtdX prior 
to mounting the writeable fs, or various ways of unlocking blocks at 
chip probe or maps setup time have been discussed in the archives.

-- 
Todd
