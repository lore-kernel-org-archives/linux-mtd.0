Received: from beaver.sibername.com ([64.15.155.210])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFuu1-0006aa-ON
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 17:21:20 +0000
Received: from [206.191.32.162] (port=54930 helo=haven.ott.precidia.com)
	by beaver.sibername.com with esmtpa (Exim 4.68)
	(envelope-from <thraxisp@logicaloutcome.ca>) id 1JFutt-0002SX-8A
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 12:21:06 -0500
Message-Id: <2B52FCEB-D871-4D9B-81D1-E03F7698AF96@logicaloutcome.ca>
From: Glenn Henshaw <thraxisp@logicaloutcome.ca>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20080117114353.0bc71dac@zod.rchland.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v915)
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Date: Fri, 18 Jan 2008 12:20:58 -0500
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 17-Jan-08, at 12:43 PM, Josh Boyer wrote:

> On Thu, 17 Jan 2008 17:26:01 +0100
> J=F6rn Engel <joern@logfs.org> wrote:
>
>> On Thu, 17 January 2008 17:12:29 +0100, Matthieu CASTET wrote:
>>>
>>> we have a 240 MB jffs2 partition with summary enabled and no
>>> compression. We use 2ad8ee713566671875216ebcec64f2eda47bd19d git =20
>>> jffs2
>>> version
>>> =
(http://git.infradead.org/?p=3Dmtd-2.6.git;a=3Dcommit;h=3D2ad8ee7135666718=
75216ebcec64f2eda47bd19d=20
>>> )
>>>
>>>
>>> On this partition we have several file (less than 1 MB) and a big =20=

>>> file
>>> in the root (200 MB).
>>>
>>> The big file is a FAT image that is exported with usb-storage =20
>>> (with usb
>>> device) or mounted on a loopback device.
>>>
>>> After some FAT operations, we manage to get in a situation were the
>>> jffs2_garbage_collect_pass take 12 minutes.
>>>
>>> jffs2_lookup for the big file (triggered with a ls in the root) =20
>>> take 12
>>> minutes.
>>>
>>> If we do a ls without waiting that jffs2_garbage_collect_pass =20
>>> finish, ls
>>> takes 12 minutes to complete.
>>
>> Impressive!  JFFS2 may be slow, but it shouldn't be _that_ slow.  Not
>
> How do you know?  A 200MiB file will likely have around 50,000 nodes.
> If the summary stuff is incorrect, and since we have no idea what kind
> of platform is being used here, it may well be within reason.

   I found a similar problem on an older 2.4.27 based system. We have =20=

a 64k JFFS2 partition (1024 blocks of 4kbytes). As the file system =20
fills up, the time for any operation increases exponentially. When it =20=

reaches 90% full, it takes minutes to write a file. After a cursory =20
inspection, it seems to block doing garbage collection and compressing =20=

blocks.

   We gave up and limited the capacity to 60% full at the application =20=

level.

   I'd appreciate any pointer to fix this, as migrating to a 2.6 =20
kernel is not an option.


--=20
Glenn Henshaw                     Logical Outcome Ltd.
e: thraxisp@logicaloutcome.ca     w: www.logicaloutcome.ca
