Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckpE8-0008Cv-Gt
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 09:46:50 +0000
Subject: Re: [PATCH] ubifs: fix RENAME_WHITEOUT support
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <20170306090425.61855-1-nbd@nbd.name>
 <ed7c16ef-108a-bf57-2df5-f988d52fefa3@nod.at>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <86811ecd-d8d1-2d3f-a895-dc1cb2f2abba@nbd.name>
Date: Mon, 6 Mar 2017 10:46:26 +0100
MIME-Version: 1.0
In-Reply-To: <ed7c16ef-108a-bf57-2df5-f988d52fefa3@nod.at>
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

On 2017-03-06 10:35, Richard Weinberger wrote:
> Am 06.03.2017 um 10:04 schrieb Felix Fietkau:
>> Remove faulty leftover check in do_rename(), apparently introduced in a
>> merge that combined whiteout support changes with commit f03b8ad8d386
>> ("fs: support RENAME_NOREPLACE for local filesystems")
> 
> Good find, thank you Felix.
> 
>> Fixes: 9e0a1fff8db5 ("ubifs: Implement RENAME_WHITEOUT")
> 
> Why not f03b8ad8d386?
> This commit adds the check and I oversaw that. ;-\
It seems that the merge of both commits is at fault. When I checked git
log, f03b8ad8d386 came before 9e0a1fff8db5.

- Felix
