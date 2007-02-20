Received: from smtp.parrot.fr ([213.41.120.202])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJQcg-00062z-2u
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 03:45:21 -0500
Message-ID: <45DAB517.70502@parrot.fr>
Date: Tue, 20 Feb 2007 09:45:11 +0100
From: Matthieu CASTET <matthieu.castet@parrot.fr>
MIME-Version: 1.0
To: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
Subject: Re: jffs2 Erase Block Summary overhead
References: <45D47C92.8080908@parrot.fr>
	<200702191310.12647.indrek.kruusa@artecdesign.ee>
In-Reply-To: <200702191310.12647.indrek.kruusa@artecdesign.ee>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Indrek Kruusa a écrit :
> Ühel kenal päeval (neljapäev 15 veebruar 2007 5:30 pm) kirjutas Matthieu 
> CASTET:
>> Hi,
>>
>> after doing some test on a 64MB nand flash, we see that only 50 MB can
>> be stored on the filesystem [1]. The extra 10 MB are taken by jffs2
>> summary. If we disable jffs2 sumary in the kernel, the 10MB become
>> available.
> 
> This is interesting. I have a Puppy Linux build within 52MB (ps 512B/ebs 16KB) 
> and sumtool grows it to 57MB.
> JFFS2/device with ps of 2048B/ebs 128KB has much much better compression level 
> and sum adds ca. 3-4% for this case.
Mine is a ps 512B/ebs 4KB.

> You can play with "dry" mkfs.jffs2 and different page;block sizes/file 
> counts/file types to get the whole picture.
I don't get the same result with image generated with mkfs.jffs2 and on
the fly written file :
- with mkfs.jffs2 + sumtool give me only 7 % overhead
- on the fly write give me 15 % overhead


Matthieu
