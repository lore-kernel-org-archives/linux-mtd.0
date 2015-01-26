Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YFtVw-0000b8-Rs
 for linux-mtd@lists.infradead.org; Mon, 26 Jan 2015 23:56:17 +0000
Message-ID: <54C6D408.5050704@nod.at>
Date: Tue, 27 Jan 2015 00:55:52 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/2 v2] UBI: Block: Add blk-mq support
References: <1420926734-16417-1-git-send-email-richard@nod.at>
 <1420926734-16417-2-git-send-email-richard@nod.at>
 <20150113162553.GA24351@infradead.org> <54B5A188.2000001@nod.at>
 <54B5A213.1090502@fb.com> <54B5A77C.9040405@nod.at> <54B5AA84.9010306@fb.com>
 <54B5AC10.6070102@nod.at> <54B5B6E4.4020400@fb.com> <54B62B2A.7010109@nod.at>
In-Reply-To: <54B62B2A.7010109@nod.at>
Content-Type: text/plain; charset=windows-1252
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

Am 14.01.2015 um 09:39 schrieb Richard Weinberger:
> Am 14.01.2015 um 01:23 schrieb Jens Axboe:
>> Which is as I suspected, you'll do each segment to the length specified,
>> hence you don't need to track the returned count from blk_rq_map_sg().
> 
> Thanks a lot for the kind explanation, Jens!
> I'll add a comment the usage of blk_rq_map_sg() to avoid further confusion.
> Am I allowed to add your Reviewed-by too?

Ping?
I'd like to add a Reviewed-by to this patch.

Thanks,
//richard
