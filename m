Received: from an-out-0708.google.com ([209.85.132.247])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I4CpZ-00072v-6L
	for linux-mtd@lists.infradead.org; Fri, 29 Jun 2007 05:31:58 -0400
Received: by an-out-0708.google.com with SMTP id c3so168758ana
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jun 2007 02:31:53 -0700 (PDT)
Message-ID: <fe810cf0706290231l473bfcf3s86b0db49c09d39f8@mail.gmail.com>
Date: Fri, 29 Jun 2007 13:31:52 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: kmpark@infradead.org
Subject: Re: [PATCH] [JFFS2] Fix unreasonable jffs2_do_reserve_space() failure
In-Reply-To: <001201c7ba2c$aa54a5b0$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0706282325k536bf24ct6ad216f0c980e97c@mail.gmail.com>
	<001201c7ba2c$aa54a5b0$e1ac580a@swcenter.sec.samsung.co.kr>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/29/07, Kyungmin Park <kyungmin.park@samsung.com> wrote:
> Hi,
>
> After this patch, I can't delete the existing files. So we can't operation
> anymore.

It's strange. You should understand that pre patch
jffs2_refile_wbuf_blocks() could also put block to erasable_list. I
mean random ((jiffies + (n++)) & 127) condition. So basically patch
doesn't change that behavior. We just _always_ put one block in
erasable_list if it is empty. Pre patch version does exactly the same
but with some randomness.

>
> How about to reserve the one more block to GC for this case?
>

Don't feel it is necessary.

> The following is my scenario.
>

Just tried to delete/write/mount/unmount with patched JFFS2 and found
no issues you have described.

My point is if you got these errors with patch applied, you _must_ get
them w/o patch as well (but with some randomness).

Thanks,
Alexander
