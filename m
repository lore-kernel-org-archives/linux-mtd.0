Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwDXb-0005sL-NC
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 18:21:12 +0000
Received: by padhx2 with SMTP id hx2so4105633pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2015 10:20:49 -0800 (PST)
Date: Tue, 10 Nov 2015 10:20:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Saurabh Sengar <saurabh.truth@gmail.com>
Cc: andy.shevchenko@gmail.com, joern@lazybastard.org, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: phram: error handling
Message-ID: <20151110182047.GP12143@google.com>
References: <CAHp75VeUie1VdWUgXfFD6XqU5t_9j-40papME3-8MUvjMh1iMw@mail.gmail.com>
 <1447050198-20562-1-git-send-email-saurabh.truth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1447050198-20562-1-git-send-email-saurabh.truth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 09, 2015 at 11:53:18AM +0530, Saurabh Sengar wrote:
> registering the device with NULL pointer can lead to crash,
> hence fixing it
> 
> Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
> ---
> > Andy Shevchenko wrote:
> > Hmm… Why not just checking it before an register attempt? I think user
> > is in right to know as many problems as they have at one shot, with
> > your patch if there are two problems the user has to try twice.
> Yes, taken your feedback, fixing it here in v2 as you recommended
> 
>  drivers/mtd/devices/phram.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 8b66e52..46b7a8a 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -257,6 +257,9 @@ static int phram_setup(const char *val)
>  		parse_err("illegal device length\n");
>  	}
>  
> +	if(!name)
> +		return -EINVAL;

I'm not sure how this is supposed to do anything... just because you
kfree()'d the name doesn't mean it is NULL. In fact, I don't see how
you'd get name==NULL at all. It is assigned once (in parse_name()), and
if it's NULL, we already exit early. And 'name' is never modified after
that point.

So... did you test your patch?

(*looks at the existing code a bit more*)

Hey, I think your patch is all futile anyway. Did you notice that
there's a "return" statement embedded in the parse_err() macro? So there
was no bug in the first place, and I think you're just blowing smoke.

Please verify that you're actually fixing bugs, and please test your
patches. Otherwise, you're wasting my time.

Brian

> +
>  	ret = register_device(name, start, len);
>  	if (!ret)
>  		pr_info("%s device: %#llx at %#llx\n", name, len, start);
> -- 
> 1.9.1
> 
