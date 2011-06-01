Received: from na3sys009aog113.obsmtp.com ([74.125.149.209])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRlqT-0004f4-FY
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 13:52:26 +0000
Received: by mail-vx0-f177.google.com with SMTP id 2so5613864vxd.8
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 06:52:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306914894.4405.56.camel@localhost>
References: <BANLkTimWafVH_bCJomN1uFW=t4+jRw1L9g@mail.gmail.com>
	<1306914894.4405.56.camel@localhost>
Date: Wed, 1 Jun 2011 09:52:22 -0400
Message-ID: <BANLkTikv7hTLqjyMhe17KEwXForx4S7t4Q@mail.gmail.com>
Subject: Re: -EBADMSG with free-space-fixup flag
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, "Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, Jun 1, 2011 at 3:54 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> NB: I have ubi attached with --vid-hdr-offset of 2048 because of the
>> subpage writing limitations of davinci-nand.
>
> Which means your driver may be incorrect - it should report that it does
> not support sub-pages - does it do this? Then UBI will not even try to
> use sub-pages and you won't need that option.

Right. This is a known issue with davinci_nand driver; the last time I
investigated this there was only a way for the NAND chip to report
support for subpages and no way for the driver to do so analogously.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
