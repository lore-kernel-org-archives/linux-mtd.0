Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJO5-000543-Bw
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:05:38 +0000
Received: by vws8 with SMTP id 8so466808vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:05:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307524774.31223.34.camel@localhost>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-27-git-send-email-dbaryshkov@gmail.com>
	<1307524774.31223.34.camel@localhost>
Date: Wed, 8 Jun 2011 18:05:32 +0400
Message-ID: <BANLkTi=Fzn=FCK08xBG8HwpHuXdpRP_h4w@mail.gmail.com>
Subject: Re: [PATCH 26/44] mtd: cs553x_nand.c: use mtd_device_parse_register
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/8/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2011-06-07 at 17:36 +0400, Dmitry Eremin-Solenikov wrote:
>> +                       mtd_device_parse_register(cs553x_mtd[i], NULL,
>> 0,
>> +                                       NULL, 0);
>
> You do not need 2 lines here.

84 syms.

-- 
With best wishes
Dmitry
