Received: from py-out-1112.google.com ([64.233.166.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KTyjD-0007yD-36
	for linux-mtd@lists.infradead.org; Fri, 15 Aug 2008 12:48:27 +0000
Received: by py-out-1112.google.com with SMTP id a73so1046434pye.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Aug 2008 05:48:26 -0700 (PDT)
Message-ID: <8bd0f97a0808150548s34f26232m2287664148668eb4@mail.gmail.com>
Date: Fri, 15 Aug 2008 08:48:25 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH 1/1] MTD Maps: initial driver for using gpios to assist in
	addressing of parallel flash as is on the tinyboards
In-Reply-To: <1218792593.3184.71.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1218789421-9995-1-git-send-email-cooloney@kernel.org>
	<1218792593.3184.71.camel@pmac.infradead.org>
Cc: Bryan Wu <cooloney@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 15, 2008 at 5:29 AM, David Woodhouse wrote:
> On Fri, 2008-08-15 at 16:37 +0800, Bryan Wu wrote:
>> +#define pr_devinit(fmt, args...) ({ static const __devinitconst char
>> __fmt[] = fmt; printk(__fmt, ## args); })
>
> You've added that macro twice in MTD code already -- and now you're
> adding it twice more (although I suspect only one was intentional).
> Where are we with putting it in include/linux/ where it belongs?

i havent tried since the last thread on the topic went nowhere.  guess
i could try again.
-mike
