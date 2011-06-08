Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJnI-0005cm-V7
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:31:41 +0000
Received: by vxd2 with SMTP id 2so500204vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:31:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307543054.31223.104.camel@localhost>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-6-git-send-email-dbaryshkov@gmail.com>
	<1307523682.31223.32.camel@localhost>
	<1307523765.31223.33.camel@localhost>
	<BANLkTinZ_QVBpyB+PjcPDZ44obpBmOZpcA@mail.gmail.com>
	<1307542329.31223.98.camel@localhost>
	<BANLkTinqjZJuAOfCvFjZGCcj8qQwTYB7dQ@mail.gmail.com>
	<1307543054.31223.104.camel@localhost>
Date: Wed, 8 Jun 2011 18:31:37 +0400
Message-ID: <BANLkTi=QOiwfBJJUMvKC+nxjVggMzzeESA@mail.gmail.com>
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
> On Wed, 2011-06-08 at 18:22 +0400, Dmitry Eremin-Solenikov wrote:
>> On 6/8/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > On Wed, 2011-06-08 at 18:06 +0400, Dmitry Eremin-Solenikov wrote:
>> >> On 6/8/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> >> > On Wed, 2011-06-08 at 12:01 +0300, Artem Bityutskiy wrote:
>> >> >> On Tue, 2011-06-07 at 17:36 +0400, Dmitry Eremin-Solenikov wrote:
>> >> >> > +       mtd_device_parse_register(state->mtd, part_probe_types, 0,
>> >> >> > +                       pdata->parts, pdata->nr_parts);
>> >> >>
>> >> >> How about checking the return code? :-)
>> >> >
>> >> > Ok, you did not do it because the original function did not do it.
>> >> > Fair
>> >> > enough, this is a separate thing.
>> >>
>> >> Nice idea. Making mtd_device_parse_register a __must_check function :)
>> >
>> > But please, do it as a separate patch.
>>
>> Why not make it a __must_check from the beginning? And fixup problematic
>> drivers later.
>
> Because it is a separate problem and separate set of patches is needed.
> First, solve one problem, then start solving the other.
>
> Secondly, if someone will later prove that __must_check was a mistake,
> we can just revert that separate patch.

Roger.

-- 
With best wishes
Dmitry
