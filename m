Received: from mail.rptsys.com ([192.119.205.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1fzd-0001oE-Fs
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2018 22:26:03 +0000
Message-ID: <5ABD67EC.6060307@raptorengineering.com>
Date: Thu, 29 Mar 2018 17:25:48 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
CC: linux-mtd@lists.infradead.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH] mtd/powernv_flash: Enable partition support
References: <746862757.61253.1522008301855.JavaMail.zimbra@raptorengineeringinc.com>
 <CACna6rwWT1CNkov7PJiCCDYGciEa_assaj0MO3nkJNL2h_sJOA@mail.gmail.com>
 <5ABD5E1B.9050500@raptorengineering.com>
 <CACna6rxHmPFJqGdvBHt62R9YKVAtajj4S2e=+B6t+EOr7bpApA@mail.gmail.com>
In-Reply-To: <CACna6rxHmPFJqGdvBHt62R9YKVAtajj4S2e=+B6t+EOr7bpApA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/29/2018 05:11 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 29 March 2018 at 23:43, Timothy Pearson
> <tpearson@raptorengineering.com> wrote:
>> Will resend with Signed-off-by.
>>
>> Before this patch, the driver was not picking up the OF-provided
>> partition list.  It seemed specifically designed to register only one
>> large partition covering the entire PNOR; mtd_device_register() does n=
ot
>> run parsing of any type AFAIK.
>=20
> Please don't top post.

Whoops!  I have to interface with other entities that need top posting
and slipped up here.  Sorry about that!

> This is how mtd_device_register is defined:
> #define mtd_device_register(master, parts, nr_parts) \
>         mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
>=20
> So your patch seems to be replacing
> mtd_device_parse_register(&data->mtd, NULL, NULL, NULL, 0);
> with
> mtd_device_parse_register(&data->mtd, part_probes, NULL, NULL, 0);
>=20
> I still claim that all it does is replacing list of default parsers:
> "cmdlinepart", "ofpart", NULL
> with a custom list:
> "ofpart", NULL
>=20
> I don't think you need that. Probably the only change you really need i=
s to add:
> mtd_set_of_node(&data->mtd, dev->of_node);

It's possible; I'm not as familiar with the MTD subsystem as I should
be.  That being said, in this application there is no chance of
partition information being passed via kernel command line, so the right
thing to do from a design perspective is lock the parser to ofpart only.

If you need me to remove that part of the patch I will do so.

Thanks!

--=20
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
