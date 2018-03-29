Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1flh-0004NE-IO
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2018 22:11:38 +0000
Received: by mail-ot0-x22e.google.com with SMTP id j8-v6so401316ota.7
 for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2018 15:11:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5ABD5E1B.9050500@raptorengineering.com>
References: <746862757.61253.1522008301855.JavaMail.zimbra@raptorengineeringinc.com>
 <CACna6rwWT1CNkov7PJiCCDYGciEa_assaj0MO3nkJNL2h_sJOA@mail.gmail.com>
 <5ABD5E1B.9050500@raptorengineering.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 30 Mar 2018 00:11:23 +0200
Message-ID: <CACna6rxHmPFJqGdvBHt62R9YKVAtajj4S2e=+B6t+EOr7bpApA@mail.gmail.com>
Subject: Re: [PATCH] mtd/powernv_flash: Enable partition support
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linux-mtd@lists.infradead.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 March 2018 at 23:43, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> Will resend with Signed-off-by.
>
> Before this patch, the driver was not picking up the OF-provided
> partition list.  It seemed specifically designed to register only one
> large partition covering the entire PNOR; mtd_device_register() does not
> run parsing of any type AFAIK.

Please don't top post.

This is how mtd_device_register is defined:
#define mtd_device_register(master, parts, nr_parts) \
        mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)

So your patch seems to be replacing
mtd_device_parse_register(&data->mtd, NULL, NULL, NULL, 0);
with
mtd_device_parse_register(&data->mtd, part_probes, NULL, NULL, 0);

I still claim that all it does is replacing list of default parsers:
"cmdlinepart", "ofpart", NULL
with a custom list:
"ofpart", NULL

I don't think you need that. Probably the only change you really need is to add:
mtd_set_of_node(&data->mtd, dev->of_node);
