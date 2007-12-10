Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J1ojg-00085r-IU
	for linux-mtd@lists.infradead.org; Mon, 10 Dec 2007 19:56:22 +0000
Date: Mon, 10 Dec 2007 20:55:44 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: fabien <fabien.fb@gmail.com>
Subject: Re: Jffs2 something strange
In-Reply-To: <f8f856500712070740p3298da2eu882e97fe4b074634@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0712102047240.1975@lnxricardw.se.axis.com>
References: <f8f856500712070740p3298da2eu882e97fe4b074634@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 7 Dec 2007, fabien wrote:

> How it is possible with 646 KBytes of data to have 96% used in 1MBytes
> mtd partition space ?
> Please explain me, may be i did something wrong ?

JFFS2 needs to have a few extra (the actual number varies depending on the 
size of the partition and the eraseblock size) eraseblocks in order to be 
able to erase and write to the file system. The actual number is 
calculated when the file system is mounted. At least two eraseblocks are 
needed to allow deletes, and at least one more to allow writes.

With an eraseblock size of 128kB (0x20000) and a partition of 1MB 
(0x100000), assuming three eraseblocks are reserved for delete and write 
operations, this ends up being 384kB of reserved space, which probably 
accounts for the 96% used figure you see.

/Ricard
