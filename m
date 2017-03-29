Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctFUf-0002yG-06
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 15:26:43 +0000
Subject: Re: [PATCH] ubifs: fix RENAME_WHITEOUT support
To: Felix Fietkau <nbd@nbd.name>, linux-mtd@lists.infradead.org
References: <20170306090425.61855-1-nbd@nbd.name>
 <ed7c16ef-108a-bf57-2df5-f988d52fefa3@nod.at>
 <86811ecd-d8d1-2d3f-a895-dc1cb2f2abba@nbd.name>
From: Richard Weinberger <richard@nod.at>
Message-ID: <3ba8e801-ef93-9784-ba01-ddcbdd30c6aa@nod.at>
Date: Wed, 29 Mar 2017 17:26:12 +0200
MIME-Version: 1.0
In-Reply-To: <86811ecd-d8d1-2d3f-a895-dc1cb2f2abba@nbd.name>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Felix,

Am 06.03.2017 um 10:46 schrieb Felix Fietkau:
> On 2017-03-06 10:35, Richard Weinberger wrote:
>> Am 06.03.2017 um 10:04 schrieb Felix Fietkau:
>>> Remove faulty leftover check in do_rename(), apparently introduced in a
>>> merge that combined whiteout support changes with commit f03b8ad8d386
>>> ("fs: support RENAME_NOREPLACE for local filesystems")
>>
>> Good find, thank you Felix.
>>
>>> Fixes: 9e0a1fff8db5 ("ubifs: Implement RENAME_WHITEOUT")
>>
>> Why not f03b8ad8d386?
>> This commit adds the check and I oversaw that. ;-\
> It seems that the merge of both commits is at fault. When I checked git
> log, f03b8ad8d386 came before 9e0a1fff8db5.

Yeah, the combination of both breaks it.
Let's get this into -rcX.

Thanks,
//richard
