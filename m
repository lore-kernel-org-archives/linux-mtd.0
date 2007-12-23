Received: from fk-out-0910.google.com ([209.85.128.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J6Pnw-0005uj-24
	for linux-mtd@lists.infradead.org; Sun, 23 Dec 2007 12:19:46 +0000
Received: by fk-out-0910.google.com with SMTP id 18so2238824fkq.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 Dec 2007 04:19:37 -0800 (PST)
Date: Sun, 23 Dec 2007 15:02:14 +0300
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 2/3] [POWERPC][NAND] FSL UPM NAND driver
Message-ID: <20071223120214.GC5643@zarina>
References: <20071221203552.GA4738@localhost.localdomain>
	<20071221204130.GB4829@localhost.localdomain>
	<20071223133329.9d2c44e4.sfr@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <20071223133329.9d2c44e4.sfr@canb.auug.org.au>
Cc: linuxppc-dev@ozlabs.org, Anton Vorontsov <avorontsov@ru.mvista.com>,
	linux-mtd@lists.infradead.org
Reply-To: cbouatmailru@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 23, 2007 at 01:33:29PM +1100, Stephen Rothwell wrote:
> On Fri, 21 Dec 2007 23:41:30 +0300 Anton Vorontsov <avorontsov@ru.mvista.com> wrote:
> >
> > +static int __devinit upm_chip_probe(struct of_device *ofdev,
> > +				    const struct of_device_id *ofid)
> > +{
> > +	struct upm_data *ud;
> > +	struct resource io_res;
> > +	const u32 *prop;
> > +	int ret;
> > +	int size;
> > +
> > +	ud = kzalloc(sizeof(*ud), GFP_KERNEL);
> > +	if (!ud)
> > +		return -ENOMEM;
> > +
> > +	ret = of_address_to_resource(ofdev->node, 0, &io_res);
> > +	if (ret) {
> > +		dev_err(&ofdev->dev, "can't get IO base\n");
> > +		goto err;
> > +	}
> > +
> > +	prop = of_get_property(ofdev->node, "width", &size);
> > +	if (!prop || size != sizeof(u32)) {
> > +		dev_err(&ofdev->dev, "can't get chip width\n");
> > +		goto err;
> 
> Here ret is 0, is that the correct return code?

Nope.

> > +	ud->rnb_gpio = of_get_gpio(ofdev->node, 0);
> > +	if (ud->rnb_gpio >= 0) {
> > +		ret = gpio_request(ud->rnb_gpio, ofdev->dev.bus_id);
> > +		if (ret) {
> > +			dev_err(&ofdev->dev, "can't request RNB gpio\n");
> > +			goto err;
> > +		}
> > +		gpio_direction_input(ud->rnb_gpio);
> > +	} else if (ud->rnb_gpio == -EINVAL) {
> > +		dev_err(&ofdev->dev, "specified RNB gpio is invalid\n");
> > +		goto err;
> 
> Again ret is 0 here.

Much thanks for catching that!

-- 
Anton Vorontsov
email: cbou@mail.ru
backup email: ya-cbou@yandex.ru
irc://irc.freenode.net/bd2
