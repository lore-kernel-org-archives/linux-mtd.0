Received: from mika.eatserver.nl ([195.20.9.75])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SYk0s-0001JY-3u
 for linux-mtd@lists.infradead.org; Sun, 27 May 2012 20:24:31 +0000
Message-ID: <4FC28D71.1040107@aimvalley.nl>
Date: Sun, 27 May 2012 22:24:17 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Resizing of an existing UBIFS
References: <4FBB3506.3020904@bury.com>	
 <1337669583.2483.88.camel@sauron.fi.intel.com>	 <4FBF5B20.50406@aimvalley.nl>
 <1338040835.2525.41.camel@koala>
In-Reply-To: <1338040835.2525.41.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/26/12 16:00, Artem Bityutskiy wrote:
> On Fri, 2012-05-25 at 12:12 +0200, Norbert van Bolhuis wrote:
>> This is not a problem for a UBIFS being created dynamically, so with
>> ubiformat + ubiattach + ubimkvol ? In this case the size of the lprops
>> area is determined by the total amount of LEBs of the MTD partition ?
>
> No, it is set according to the --max-leb-cnt parameter. Then UBIFS will
> be able to grow up to "--max-leb-cnt" easily.
>
>> A UBIFS volume can then be resized with ubirsvol as long as it does not
>> conflict with other volumes and does not exceed the total amount of
>> LEBs of the MTD partition ?
>
> Yes, and if you resize withing '--max-leb-cnt', the UBIFS will
> automatically resize itself.
>
> http://linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt
>

I was asking because there is no --max-leb-cnt parameter wen creating a UBIFS
dynamically, or is there ?

---
N. van Bolhuis.
