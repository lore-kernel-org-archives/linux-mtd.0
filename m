Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKTpR-0001GY-N5
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 11:13:17 +0000
Received: by eyh6 with SMTP id 6so460620eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 04:13:11 -0700 (PDT)
Subject: Re: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is set
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1304722703-7904-3-git-send-email-mlcreech@gmail.com>
References: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
	<1304722703-7904-3-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 14:09:49 +0300
Message-ID: <1305198589.2713.97.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 18:58 -0400, Matthew L. Creech wrote:
> +	if (c->space_fixup) {
> +		err = ubifs_fixup_free_space(c);
> +		if (err)
> +			goto out;
> +	}
> +
>  	dbg_gen("re-mounted read-write");
>  	c->remounting_rw = 0;
>  	err = dbg_check_space_info(c);

Note, I've moved the 'ubifs_fixup_free_space()' a bit down to make sure
we first print "re-mounted" and "deferred recovery completed" messages,
and then start fixing up. I think this is a bit neater.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
