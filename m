Received: from av-gw1.cc.tut.fi ([130.230.130.110])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IY0AT-000840-PY
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 10:04:46 -0400
Message-ID: <46F12C4D.9060204@tut.fi>
Date: Wed, 19 Sep 2007 17:03:57 +0300
From: Timo Piiroinen <timo.piiroinen@tut.fi>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: mkfs.jffs2 and mksum
References: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>
	<1190206217.14370.155.camel@sauron>
In-Reply-To: <1190206217.14370.155.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy kirjoitti:
> Hi,
>
> On Wed, 2007-09-19 at 15:45 +0300, Timo Piiroinen wrote:
>   
>> I have done jffs2 image with --pad option to match my flash size and it 
>> works fine. However, if I want to use summary, the sumtool creates smaller 
>> image than original padded jffs2 image and the flash isn't fully used. 
>> I write the jffs2 image using bootloader, where I set the size of the 
>> flashing length match the filesize. Is there any way to pad summed 
>> image to larger so that i can fully occupy flash?
>> sumtool -p option doesn't allow to set filesize.
>>     
>
> If your flash is NAND flash I do not recommend you to pad it because
> writing FFs may have side-effects.
>
>   
Yes it is NAND flash. I tried to add dummy file to my filesystem to 
increase the size of image and after that remove that dummy file to free 
space, unfortunately I couldn't remove the file cause the filesystem was 
100% full,
and that's the real problem.
