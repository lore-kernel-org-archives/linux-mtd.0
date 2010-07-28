Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oe1Fs-0007df-2m
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 07:40:45 +0000
Message-ID: <4C4FDEF5.2040405@parrot.com>
Date: Wed, 28 Jul 2010 09:40:37 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: ubifs : corruption after power cut test
References: <4C346D5B.2000609@parrot.com>
	<4C3C1572.8080501@parrot.com>		<4C3C2740.2040105@parrot.com>
	<4C3C30D1.9030005@parrot.com>	<1279031064.31639.90.camel@localhost>
	<4C3C81E3.3030407@parrot.com>
In-Reply-To: <4C3C81E3.3030407@parrot.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Matthieu CASTET a écrit :
> Artem Bityutskiy a écrit :
>> On Tue, 2010-07-13 at 11:24 +0200, Matthieu CASTET wrote:
>>> Matthieu CASTET a écrit :
>>>> Matthieu CASTET a écrit :
>>>>> Hi,
>>>>>
>>>>> we found some bug in our driver. Now there no more ubifs error when
>>>>> there is uncorrectable ecc error (they should happen in the last
>>>>> (interrupted) written page).
>>>>>
>>>>> But now we got "validate_master: bad master node at offset 69632 error
>>>>> 7" [1].
>>>> notice that gc_lnum==-1 in this case.
>>>> Also this didn't happen on power cut.
>>>> The senario was :
>>>> - power cut
>>>> - mount fs [1]
>>>> - do some fs operation
>>>> - umount fs quickly (9 second after mount in this case) [2]
>>>> - mount fs [3]
>>>>
>>>> The the problem seems that gc_lnum==-1 is not handled in mount or
>>>> shouldn't happen in umount.
>>>>
>>> The attached patch try to support mount with gc_lnum == -1.
>>>
>>> Does it look sane ?
>> I did not give it much thought, but I do not see how master node can end
>> up with gc_lnum = -1 in it, and it seems we assumed this cannot happen.
>> Could you please add this hack to your kernel? It should catch the
>> situations when we write gc_lnum == -1 to the master node and print the
>> stack dump, which should give some idea about the code-path which causes
>> it.
> Ok thanks, I will run it
> 
> When checking the code, I saw that switch_gc_head can set c->gc_lnum to -1.
> 
> In ubifs_put_super, we set c->mst_node->gc_lnum to c->gc_lnum and write 
> master node.
> Can't ubifs_put_super run while switch_gc_head set gc_lnum to -1 ?
> 
I manage to reproduce it with the backtrace [1].

Matthieu

[1]
# UBIFS: recovery completed
UBIFS: mounted UBI device 3, volume 0, name "test"
UBIFS: file system size:   30474240 bytes (29760 KiB, 29 MiB, 240 LEBs)
UBIFS: journal size:       1523712 bytes (1488 KiB, 1 MiB, 12 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  1439373 bytes (1405 KiB)
checking all files...
++++++ power failure detected, cleaning up tmpfile (262415 bytes)
### round 0 : 16 seconds
UBIFS: un-mount UBI device 3, volume 0
ubifs_write_master: gc_lnum is -1!
[<c00279f0>] (dump_stack+0x0/0x14) from [<c00d64c4>] 
(ubifs_write_master+0x170/0x1b0)
[<c00d6354>] (ubifs_write_master+0x0/0x1b0) from [<c00ce264>] 
(ubifs_put_super+0x1a0/0x1d8)
  r7:c7a7e000 r6:00000003 r5:c795c124 r4:c795c100
[<c00ce0c4>] (ubifs_put_super+0x0/0x1d8) from [<c007ed20>] 
(generic_shutdown_super+0x78/0xfc)
  r8:00000000 r7:c780cf38 r6:c780cf20 r5:c01b08bc r4:c7a9d400
[<c007eca8>] (generic_shutdown_super+0x0/0xfc) from [<c007ede8>] 
(kill_anon_super+0x18/0x34)
  r5:c022739c r4:0000000b
[<c007edd0>] (kill_anon_super+0x0/0x34) from [<c007ee7c>] 
(deactivate_super+0x48/0x60)
  r4:c7a9d400
[<c007ee34>] (deactivate_super+0x0/0x60) from [<c0093998>] 
(mntput_no_expire+0x64/0xc8)
  r5:c7a9d400 r4:c780cf20
[<c0093934>] (mntput_no_expire+0x0/0xc8) from [<c009456c>] 
(sys_umount+0x58/0x31c)
  r5:c780cf38 r4:c780cf18
[<c0094514>] (sys_umount+0x0/0x31c) from [<c0023c00>] 
(ret_fast_syscall+0x0/0x2c)
UBIFS error (pid 285): validate_master: bad master node at offset 104448 
error 7
