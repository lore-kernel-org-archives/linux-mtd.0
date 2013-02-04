Received: from mail-ia0-x234.google.com ([2607:f8b0:4001:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2Pr1-0007M0-UZ
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 17:29:16 +0000
Received: by mail-ia0-f180.google.com with SMTP id f27so8237536iae.25
 for <linux-mtd@lists.infradead.org>; Mon, 04 Feb 2013 09:29:14 -0800 (PST)
Message-ID: <510FEFE2.3060704@gmail.com>
Date: Mon, 04 Feb 2013 22:59:06 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS space consumption
References: <50F97E6C.7030201@gmail.com>
 <1359961435.13791.4.camel@sauron.fi.intel.com>
In-Reply-To: <1359961435.13791.4.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/4/2013 12:33 PM, Artem Bityutskiy wrote:
> On Fri, 2013-01-18 at 22:25 +0530, Vikram Narayanan wrote:
>> But according to "df",  UBI volume 0 is sized 148.9 MiB. That's, 15.8
>> MiB more in terms of consumption.
>
> Df is not accurate with UBIFS by design, this is covered by this FAQ
> entry:
>
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_df_report
>

Sorry, I think you've mistaken my question. I've referred the above FAQ 
before framing this mail.

The above FAQ explains why the _free_ space shown by 'df' isn't 
accurate. I'm concerned here about the _total_ size shown to me by df, 
which is less than what is reported by ubinfo.

Thanks,
Vikram
