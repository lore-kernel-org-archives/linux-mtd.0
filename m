Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oqprq-0000p6-DB
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 16:08:58 +0000
Received: by fxm12 with SMTP id 12so5889393fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 09:08:51 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 1 Sep 2010 09:08:49 -0700
Message-ID: <AANLkTimuZZ-B1sO1jHAu_gjwa8Gb_WXKowORNvWHMmcT@mail.gmail.com>
Subject: UBIFS in-place vs out-of-place GC
From: Russ Dill <russ.dill@gmail.com>
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm doing a bit of research on UBIFS and something I read from a few
sources has me confused regarding garbage collection:

http://osl.sed.hu/~havasi/ubifs/#gc

>> Out-place mode:
>>
>> This mode deletes the active nodes from the tree and inserts them
>> again into a new location. Because of the wandering algorithm it
>> makes dirty nodes as well. After garbage collection, it can be
>> possible that an erase block has more dirty space created than freed
>> up.In-place mode:
>>
>> This method copies the active nodes into an empty erase block
>> and creates a displacement table to its beginning. Afterwards, it
>> logically swaps these two erase blocks, so the active nodes will
>> be accessible at the same place as before, thus modifying other
>> parts of the tree is not necessary. A big advantage of this method
>> is that it can convert all dirty space in the erase block to free space.
>> Its disadvantage is that it can cause fragmentation.
>>
>> The default GC mode of the UBIFS is in-place mode and it will
>> use a heuristic method to detect fragmentation and call out-place
>> mode.

Looking at the source, I can find the code that does the out of place
updates, but I can't find any references to in place updates or
displacement tables. What gives?
