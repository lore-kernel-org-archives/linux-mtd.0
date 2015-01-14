Message-ID: <54B5B6E4.4020400@fb.com>
Date: Tue, 13 Jan 2015 17:23:00 -0700
From: Jens Axboe <axboe@fb.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/2 v2] UBI: Block: Add blk-mq support
References: <1420926734-16417-1-git-send-email-richard@nod.at>
 <1420926734-16417-2-git-send-email-richard@nod.at>
 <20150113162553.GA24351@infradead.org> <54B5A188.2000001@nod.at>
 <54B5A213.1090502@fb.com> <54B5A77C.9040405@nod.at> <54B5AA84.9010306@fb.com>
 <54B5AC10.6070102@nod.at>
In-Reply-To: <54B5AC10.6070102@nod.at>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, tom.leiming@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/13/2015 04:36 PM, Richard Weinberger wrote:
> 
> 
> Am 14.01.2015 um 00:30 schrieb Jens Axboe:
>>> If I understand you correctly it can happen that blk_rq_bytes() returns
>>> more bytes than blk_rq_map_sg() allocated, right?
>>
>> No, the number of bytes will be the same, no magic is involved :-)
> 
> Good to know. :)
> 
>> But lets say the initial request has 4 bios, with each 2 pages, for a
>> total of 8 segments. Lets further assume that the pages in each bio are
>> contiguous, so that blk_rq_map_sg() will map this to 4 sg elements, each
>> 2xpages long.
>>
>> Now, this may already be handled just fine, and you don't need to
>> update/store the actual sg count. I just looked at the source, and I'm
>> assuming it'll do the right thing (ubi_read_sg() will bump the active sg
>> element, when that size has been consumed), but I don't have
>> ubi_read_sg() in my tree to verify.
> 
> Currently the sg count is hard coded to UBI_MAX_SG_COUNT.

The max count doesn't matter, that just provides you a guarantee that
you'll never receive a request that maps to more than that. The point
I'm trying to make is that if you receive 8 segments and it maps to 4,
then you better not look at segments 5..8 after it being mapped.
Whatever the max is, doesn't matter in this conversation.

> I'm sorry, I forgot to CC you and hch to this patch:

Which is as I suspected, you'll do each segment to the length specified,
hence you don't need to track the returned count from blk_rq_map_sg().

-- 
Jens Axboe
