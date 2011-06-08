Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJOl-00056U-7q
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:06:19 +0000
Received: by vws8 with SMTP id 8so467807vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:06:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307523765.31223.33.camel@localhost>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-6-git-send-email-dbaryshkov@gmail.com>
	<1307523682.31223.32.camel@localhost>
	<1307523765.31223.33.camel@localhost>
Date: Wed, 8 Jun 2011 18:06:18 +0400
Message-ID: <BANLkTinZ_QVBpyB+PjcPDZ44obpBmOZpcA@mail.gmail.com>
Subject: Re: [PATCH 05/44] mtd: bfin-async-flash.c: use
	mtd_device_parse_register
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
> On Wed, 2011-06-08 at 12:01 +0300, Artem Bityutskiy wrote:
>> On Tue, 2011-06-07 at 17:36 +0400, Dmitry Eremin-Solenikov wrote:
>> > +       mtd_device_parse_register(state->mtd, part_probe_types, 0,
>> > +                       pdata->parts, pdata->nr_parts);
>>
>> How about checking the return code? :-)
>
> Ok, you did not do it because the original function did not do it. Fair
> enough, this is a separate thing.

Nice idea. Making mtd_device_parse_register a __must_check function :)

-- 
With best wishes
Dmitry
