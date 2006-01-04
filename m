Received: from mail99.messagelabs.com ([216.82.255.195])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eu390-0000q2-Lc
	for linux-mtd@lists.infradead.org; Wed, 04 Jan 2006 02:33:18 -0500
Message-ID: <BFE6A582D4E7C4408B28C922F9D55842094DF86E@canary.corp.resmed.org>
From: Clancy Dennis <ClancyD@resmed.com.au>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 4 Jan 2006 18:33:04 +1100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: MTD Linux Basics (Modules etc..)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hullo all

New to the list and to MTD.

I have been working with debian linux over the last month or so getting it
to work on compact flash cards and other removable storage.

My latest challenge though is to create a bootable Diskonchip 2000 recovery
partition for a versalogic jaguar board.

I am using kernel 2.6.14 and have tried many different methods.

The main methods i have read about are
a) using the new nftl and inftl modules with the 2.6 kernel
		then use nftl_format etc...

b)using the old and deprectated doc2000 and docprobe modules with 2.6

c) using m systems modules patched into a 2.4 kernel (unfavorable)

d) using m systems dos utilities to set up the DOC (most succesful so far,
unfortunatly i cannot mount the created partition under linux)

i have a million questions but im sure that it is some part of my method
that is incorrect and was hoping for some assistance.

Also, google comes up rather dry to search terms such as "anand media header
not found", and flunknownmedia, would anyone know a good resource of
information about linux and DiskonChip2000 devices?

Thanks

Clancy Dennis

Warning:  Copyright ResMed.  Where the contents of this email and/or attachment includes materials prepared by ResMed, the use of those
materials is subject exclusively to the conditions of engagement between ResMed and the intended recipient.
 
This communication is confidential and may contain legally privileged information.
By the use of email over the Internet or other communication systems, ResMed is not waiving either confidentiality of, or legal
privilege in,the content of the email and of any attachments.
If the recipient of this message is not the intended addressee, please call ResMed immediately on  +61 2 9886 5000 Sydney, Australia.
