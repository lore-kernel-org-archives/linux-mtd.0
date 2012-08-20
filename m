Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3RhD-00080X-IS
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 13:07:08 +0000
Received: by lagu2 with SMTP id u2so3101417lag.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 06:07:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345467898.2848.29.camel@sauron.fi.intel.com>
References: <1345464561-24464-1-git-send-email-richard.genoud@gmail.com>
 <1345464561-24464-4-git-send-email-richard.genoud@gmail.com>
 <20120820155210.64d64803@pixies.home.jungo.com>
 <1345467898.2848.29.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 15:06:44 +0200
Message-ID: <CACQ1gAgJ87c3XBhpW+xfKSeXz6tjxTmTx_nVQXJ4SuPCru1Zhw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] UBI: accept empty string for vid_hdr_offs parameter
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/20 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2012-08-20 at 15:52 +0300, Shmulik Ladkani wrote:
>> Hi Richard,
>>
>> On Mon, 20 Aug 2012 14:09:17 +0200 Richard Genoud <richard.genoud@gmail.com> wrote:
>> > @@ -1292,7 +1292,11 @@ static int __init bytes_str_to_int(const char *str)
>> >     unsigned long result;
>> >
>> >     result = simple_strtoul(str, &endp, 0);
>> > -   if (str == endp || result >= INT_MAX) {
>> > +   if (str == endp)
>> > +           /* empty string, assume it's 0 */
>> > +           return 0;
>
> Please, let's not over-engineer this, do not bother with ",,", use ",0,"
> instead. Just do amend the documentation properly.

ok, I'll drop the patch and change the doc.
