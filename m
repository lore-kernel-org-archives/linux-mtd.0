Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRgX4-00023X-PW
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 08:12:03 +0000
Received: by fxm14 with SMTP id 14so4787558fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 01:12:01 -0700 (PDT)
Subject: Re: ubifs_decompress: cannot decompress ...
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1306915328.4405.62.camel@localhost>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
	<1306915328.4405.62.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 11:07:36 +0300
Message-ID: <1306915656.4405.67.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
	MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-01 at 11:02 +0300, Artem Bityutskiy wrote:
> I see the following possibilities:
> 
> 1. The data has been written like this - then the bug is at writing
> side. Check the data node - what is its length, is CRC correct? It would
> be useful to dump the node which cannot be decompressed - I'd accept
> such patch with great delight.
> 
> 2. You had power cuts while this peace of data has been written and
> recovery did not work correctly. Enabling mount and recovery messages
> would help.
> 
> 3. I merged several changes to 2.6.39 which could in theory break
> recovery. Try to reproduce this with 2.6.38.
> 
> 4. The fixup feature might have broke this - we might for some reason
> read less data than there. Although I see FFs start at offset 416, which
> is strange.

So Matthew, let's try to exclude some of these possibilities. Please,
send me some description about what you do to reproduce this. Is this
error persistent or it goes away after remount or reboot. And other
information relevant to the above points.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
