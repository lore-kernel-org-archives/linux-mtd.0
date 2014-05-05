Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhDQx-0008P8-Rm
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 07:35:32 +0000
Message-ID: <1399275304.15290.15.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/3] nandtest: Introduce multiple reads & check iterations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 05 May 2014 10:35:04 +0300
In-Reply-To: <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Guido =?ISO-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-04-28 at 10:14 -0300, Ezequiel Garcia wrote:
>                         }
> -                       if (erase_and_write(test_ofs, wbuf, rbuf))
> +                       if (erase_and_write(test_ofs, wbuf, rbuf,
> nr_reads))
>                                 continue;
>                         if (keep_contents)
> -                               erase_and_write(test_ofs, kbuf, rbuf);
> +                               erase_and_write(test_ofs, kbuf, rbuf,
> 1);

I think it would make sense to make the default to be at least 2, or may
be 4.

If you added this improvement, let's make sure people have it on by
default.

-- 
Best Regards,
Artem Bityutskiy
