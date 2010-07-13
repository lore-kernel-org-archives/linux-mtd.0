Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYh7x-0007QH-P7
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 15:10:34 +0000
Message-ID: <4C3C81E3.3030407@parrot.com>
Date: Tue, 13 Jul 2010 17:10:27 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: ubifs : corruption after power cut test
References: <4C346D5B.2000609@parrot.com> <4C3C1572.8080501@parrot.com>	
	<4C3C2740.2040105@parrot.com> <4C3C30D1.9030005@parrot.com>
	<1279031064.31639.90.camel@localhost>
In-Reply-To: <1279031064.31639.90.camel@localhost>
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

Artem Bityutskiy a écrit :
> On Tue, 2010-07-13 at 11:24 +0200, Matthieu CASTET wrote:
>> Matthieu CASTET a écrit :
>>> Matthieu CASTET a écrit :
>>>> Hi,
>>>>
>>>> we found some bug in our driver. Now there no more ubifs error when
>>>> there is uncorrectable ecc error (they should happen in the last
>>>> (interrupted) written page).
>>>>
>>>> But now we got "validate_master: bad master node at offset 69632 error
>>>> 7" [1].
>>> notice that gc_lnum==-1 in this case.
>>> Also this didn't happen on power cut.
>>> The senario was :
>>> - power cut
>>> - mount fs [1]
>>> - do some fs operation
>>> - umount fs quickly (9 second after mount in this case) [2]
>>> - mount fs [3]
>>>
>>> The the problem seems that gc_lnum==-1 is not handled in mount or
>>> shouldn't happen in umount.
>>>
>> The attached patch try to support mount with gc_lnum == -1.
>>
>> Does it look sane ?
> 
> I did not give it much thought, but I do not see how master node can end
> up with gc_lnum = -1 in it, and it seems we assumed this cannot happen.
> Could you please add this hack to your kernel? It should catch the
> situations when we write gc_lnum == -1 to the master node and print the
> stack dump, which should give some idea about the code-path which causes
> it.
Ok thanks, I will run it

When checking the code, I saw that switch_gc_head can set c->gc_lnum to -1.

In ubifs_put_super, we set c->mst_node->gc_lnum to c->gc_lnum and write 
master node.
Can't ubifs_put_super run while switch_gc_head set gc_lnum to -1 ?

Matthieu
