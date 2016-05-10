Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0AS9-0001Q9-Cf
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 16:24:11 +0000
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
To: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana>
Cc: "CN, Aananth (A.A.)" <caananth@visteon.com>,
 "Gunasundar, Balamanikandan (B.)" <bgunasun@visteon.com>,
 "Babu, Viswanathan (V.)" <vbabu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gnanachandran@gmail.com" <gnanachandran@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57320B0E.2060009@nod.at>
Date: Tue, 10 May 2016 18:23:42 +0200
MIME-Version: 1.0
In-Reply-To: <20160510145836.GA18568@visteon-gnana>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 10.05.2016 um 16:49 schrieb DHANAPAL, GNANACHANDRAN (G.):
> On Tue, May 10, 2016 at 03:58:58PM +0200, Richard Weinberger wrote:
>> On Tue, May 10, 2016 at 2:14 PM, DHANAPAL, GNANACHANDRAN (G.)
>> <gdhanapa@visteon.com> wrote:
>>> Hi There,
>>>
>>> We have i.MX6d based platform that has FSL BSP 3.10.17 running.
>>> There is SLC Micron NAND of size 2GB with 512K Block size and 4K min I/O  used
>>> for software storage. This NAND has got 7 partitions, Among that two partitions
>>> have Read-Write ubifs file system for runtime data and one has Read-only ubifs
>>> file system that has all the system files. Recently we have observed a issue that
>>> one of RW ubifs partition failed to mount due to invalid key type in one of index
>>> node in ubifs. we have seen the same issue in two units out of 1000 units running
>>> in the field.
>>>
>>> Following is the index node that has  invalid key in its first branch.
>>> key type = 0xa917dd4c >> 29 = 5 (invalid key)
>>>
>>>         magic          0x6101831
>>>         crc            0x944add59
>>>         node_type      9 (indexing node)
>>>         group_type     0 (no node group)
>>>         sqnum          378678
>>>         len            148
>>>         child_cnt      6
>>>         level          2
>>>         Branches:
>>>         0: LEB 569:280144 len 108 key (bad key type: 0x000001, 0xa917dd4c)
>>>         1: LEB 446:349792 len 108 key (5595, inode)
>>>         2: LEB 584:361528 len 108 key (5822, inode)
>>>         3: LEB 602:255360 len 108 key (6050, inode)
>>>         4: LEB 613:480280 len 188 key (6258, inode)
>>>         5: LEB 614:373784 len 88 key (6521, data, 25)
>>>
>>> Please help us to understand following points
>>>
>>>         1. Did this happen because abrupt power cut ? if so, how could CRC of the node still be intact?
>>>         2. Could there be any bit flip ? but still again CRC intact.
>>>         3. Would the key pointed by  corrupted branch be  UBIFS_DENT_KEY or  UBIFS_XENT_KEY ?
>>>                 Because  29 bit of key[0] (0xa917dd4c  & 0x1FFFFFFF) seems to have some kind of  hash value.
>>>                 but node (at leb 569:280144)  that is pointed by corrupted branch seem to be index node.
>>>         4. This corrupted entry is always seen  in first branch of an index node  in two failed units. Could there be reason?
>>>         5. Since CRC is intact, would there be any possibility or scenario that corrupted node can be written with valid CRC?
>>
>> Hmm, this looks like some UBIFS inconsistency.
>> If the header CRC is correct it should be be any kind of bitflip or
>> power cut issue.

Of course I meant shouldn't. :-)

>> Can you please share the whole UBI image (a nanddump) such that I can
>> inspect it?
>>
>> -- 
>> Thanks,
>> //richard
> 
> Thanks for the reply, Richard. 
> Please find two files in google drive share.
> 
> 	1. dump_mtd7_ecc.log   - /dev/mtd7 dump with ecc
> 	2. leb_peb_map_22706.log   - LEB to PEB map. This information is taken by having print in table.
> 
> Share:
> 	https://drive.google.com/open?id=0B7tYZDLZ_KAZMFd4MENlQkJuNjA

Okay, I'll look. Can't promise that I have the time for a detailed analysis.

Thanks,
//richard
