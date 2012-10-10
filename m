Received: from mail-la0-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLzAQ-0004XV-HX
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 16:29:55 +0000
Received: by mail-la0-f49.google.com with SMTP id z14so507736lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 09:29:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <507598A4.8000704@gmail.com>
References: <1348713422-16626-1-git-send-email-computersforpeace@gmail.com>
 <1349880023.20594.36.camel@sauron.fi.intel.com>
 <507598A4.8000704@gmail.com>
Date: Wed, 10 Oct 2012 09:29:51 -0700
Message-ID: <CAN8TOE8tjdP-qc_wgw1388xVTvQD2LQm8Ex+iUwfarE+NUVDYg@mail.gmail.com>
Subject: Re: [PATCH] mtd: mtd_oobtest: printk -> pr_{info,err}
From: Brian Norris <computersforpeace@gmail.com>
To: Vikram Narayanan <vikram186@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 10, 2012 at 8:47 AM, Vikram Narayanan <vikram186@gmail.com> wrote:
> On 10/10/2012 8:10 PM, Artem Bityutskiy wrote:
>>
>> On Wed, 2012-09-26 at 19:37 -0700, Brian Norris wrote:
>>>
>>> Use pr_info() and pr_err() while defining pr_fmt(). This saves a few
>>> characters, joins a few lines, and makes the code a little more readable
>>> (and grep-able).
>>>
>>> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
>>
>>
>> Not sure about this - there is a patch-set from Vikram Narayanan
>> <vikram186@gmail.com>  (Subject: [RFC PATCH 0/8] mtd_tests: Remove
>> duplicate code and cleanups) which does this for all tests. I hoped he
>> can re-send newer version.

I made the patch a while ago when playing around with the test for the
first time but never bothered to send it out until recently. It was
independent of the fact that Vikram did a (later) patch series for
this.

> Yeah. I'll send a newer version which will change the printk to pr_* for all
> the tests. I can take Brian's patch as well and send the whole series, if he
> is ok with it.

Sure, take it in your series and modify as you want (that's what the
"Signed-off-by" and GPL thing is all about). Or just rewrite it, if
your own search-and-replace is better :)

Regards,
Brian
