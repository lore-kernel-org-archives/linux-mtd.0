Received: from mail-gx0-f10.google.com ([209.85.217.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kn3oI-0004hX-Ou
	for linux-mtd@lists.infradead.org; Tue, 07 Oct 2008 04:04:35 +0000
Received: by gxk3 with SMTP id 3so6335890gxk.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Oct 2008 21:04:33 -0700 (PDT)
Message-ID: <e8775dd00810062104g446c7300vfa82c40546b8effb@mail.gmail.com>
Date: Tue, 7 Oct 2008 12:04:33 +0800
From: "Jason Liu" <liu.h.jason@gmail.com>
To: "Curt Scott" <curt_scott@yahoo.com>
Subject: Re: OOB questions
In-Reply-To: <747772.64619.qm@web81802.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <747772.64619.qm@web81802.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/10/7 Curt Scott <curt_scott@yahoo.com>:
> Hi,
>
> I am writing a MTD NAND (2K page) driver module for Linux 2.6.23.
> My NAND hardware controller performs all the ECC control
> under-the-hood.  Although is has OOB bytes available there are some
> limitaitions...
>
> L1.) Page data and OOB data must be written at the same time.
Not only your NFC but also some others require to written page data
and oob data
at the same time espically for large page size nand flash since it use oob to
store the ECC data.
> L2.) OOB data is limited to 16 bytes / page (of a 2k page).
>
It should be ok for jffs2 filesystem.

> I have some questions about the OOB requirements for MTD/JFFS2 combo.
>
> Q1.) Does MTD/JFFS2 require the ability to read/write OOB bytes?
>     Or can the system be set up operate with no OOB available?
jffs2 can work without oob.
> Q2.) Is it a requirement for OOB and non-OOB writes to happen independently?
>
May provide the interface to MTD layer. For MLC Nand flash, it's
impossible to write data and oob indepently since NOP is 1.
The file system should take care not  to write it without erase it for MLC.

> thank you for you help,
> Curt
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
