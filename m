Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1wz5-0001PW-JE
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 10:07:24 +0000
Received: by lbbgf7 with SMTP id gf7so1290652lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2012 03:07:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120816115713.726da8f2@pixies.home.jungo.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-5-git-send-email-richard.genoud@gmail.com>
 <20120816115713.726da8f2@pixies.home.jungo.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 16 Aug 2012 12:07:01 +0200
Message-ID: <CACQ1gAhFJ6AKYJpc1ZiHm+3Y=APnwUmVL3f0KW=OFMDMWzCVJg@mail.gmail.com>
Subject: Re: [PATCH 4/4] UBI: replace MTD_UBI_BEB_LIMIT with user-space
 parameter
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/16 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
> Hi Richard,
>
> Sorry for reviewing this late...
>
> On Tue, 10 Jul 2012 18:23:42 +0200 Richard Genoud <richard.genoud@gmail.com> wrote:
>> -config MTD_UBI_BEB_LIMIT
>> -     int "Maximum expected bad eraseblocks per 1024 eraseblocks"
>> -     default 20
>> -     range 2 256
>
> I see some benefit keeping the config.
>
> For the simplest systems (those having one ubi device) that need a limit
> *other* than the default (20 per 1024), they can simply set the config
> to their chosen value, as they were used to.
>
> With you approach, these system MUST pass the limit parameter via the
> ioctl / module-parameter.
That's right.
We can add a kernel config option to change the max_beb_per1024
default value (actually, this is almost the patch I send first).
But I see something disturbing with that:
It means that an ubi_attach call from userspace, without specifying
max_beb_per1024, won't have the same result, depending of the default
config value the kernel has been compiled with.
(Or maybe this behavior is acceptable).

>> +static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_per1024)
>> +{
>> +     int device_peb_count;
>> +     uint64_t device_size;
>> +     int beb_limit = 0;
>> +
>> +     /* this has already been checked in ioctl */
>> +     if (max_beb_per1024 <= 0)
>> +             goto out;
>
> Can you explain how 'max_beb_per1024 <= 0' may happen?
>
> It seems that all of your calls to 'ubi_attach_mtd_dev' pass a positive
> max_beb_per1024 value (the default is always set). See your
> 'ubi_mtd_param_parse' and 'ctrl_cdev_ioctl'. Am I missing something?
Actually it can. But it's because I made a mistake:
p->max_beb_per1024 = bytes_str_to_int(tokens[2]);
=> I didn't check the return value of this. It can fail, and if it
does the return value is >0.
I'm going to change that.

>
> Also, since max_beb_per1024 is always set, how one may specify a zero
> limit?
You can't.
Do you think we need that ?
0 should be kept for "default value", not to break user-space.
But we can use another value for 0, like 1024 or 2048.
(but honestly, I think this will add complexity for an unlikely configuration.)

>
> Regards,
> Shmulik

Regards,
Richard.


-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
