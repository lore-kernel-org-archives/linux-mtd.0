Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16NZxY-0001qv-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jan 2002 13:37:04 +0000
Received: from srvmail-mtl.montreal.ubisoft.org (srvmail-mtl.ubisoft.qc.ca [205.205.27.194])
	by ns1ca.ubisoft.qc.ca (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id IAA06509
	for <linux-mtd@lists.infradead.org>; Mon, 7 Jan 2002 08:47:57 -0500
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB84064B08A0@srvmail-mtl.montreal.ubisoft.org>
From: Patrick Allaire <pallaire@gameloft.com>
To: linux-mtd@lists.infradead.org
Subject: How to Sync properly ?
Date: Mon, 7 Jan 2002 08:47:58 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,

I am having some problems with the syncing of data to flash. Last week I
have updated to 2.4.17 kernel and with cvs MTD drivers ... because I was
having the same kinds of problems with my previous version. 

If I want to move a file from a ram drive to the flash, I will issue a 'mv'
command followed by a 'sync' command. Sometime it will be updated but
sometime it wont !!! 'sync' should not return until the flash is updated ?
no ? 

To see what was happening I added some printk in the driver, in the delete
and write ! I saw some stranges behaviour. After a 'mv', sometimes the sync
command does not do any things, sometime I see somes delteting and writing
of buffers but not all of the blocks ... the remaining block will be written
to the flash in a delay from 1 to 5 mintutes later ... and sometime the sync
work fine !!!

It is really important for me, because my system has a hard power ... so if
I tell the user the system is ready to shut down ... there wont be a halt
command issued. For me the only way to do things, is to send a sync command,
when this command return, we can shut down.

I am using ST Flash, it is working on Intel flash driver(CFI) on char and
block device, with some modifications (ST cannot write partial block)

thank you

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.
