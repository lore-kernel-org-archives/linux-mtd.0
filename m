Received: from forward14.mail.yandex.net ([2a02:6b8:0:801::4])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4Ay3-0003N4-G4
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 15:04:23 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1389970781.31307.110.camel@sauron.fi.intel.com>
References: <123921389951584@web25m.yandex.ru>
 <1389970781.31307.110.camel@sauron.fi.intel.com>
Subject: Re: Find & remove orphan LEBs from UBIFS partition
MIME-Version: 1.0
Message-Id: <104461389971034@web1j.yandex.ru>
Date: Fri, 17 Jan 2014 19:03:54 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



17.01.2014, 18:59, "Artem Bityutskiy" <dedekind1@gmail.com>:
> On Fri, 2014-01-17 at 13:39 +0400, Konstantin Tokarev wrote:
>
>> šHi all,
>>
>> šHow can I find and remove LEBs which don't correspond to known files
>> šusing internal API of UBIFS?
>> šAFAIU, somethinng like this is done on recovery during mount, but in
>> šmy case superblock is not dirty, so I'd like to force cleanup with
>> šcustom mount option.
>
> Are you trying to do something like 'secure deletion' ? Disclosing your
> intentions would help understanding what you need. I do not quite
> understand.
>
> Do you want to fine all LEBs which do not contain anything useful like
> data or meta-data, and unmap them?

Yes, exactly.

-- 
Regards,
Konstantin
