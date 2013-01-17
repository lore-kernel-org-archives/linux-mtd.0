Received: from mail-ie0-f170.google.com ([209.85.223.170])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TvyQ6-0002VC-Df
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 22:58:51 +0000
Received: by mail-ie0-f170.google.com with SMTP id k10so5602094iea.15
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jan 2013 14:58:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1358430969.2731.253.camel@sauron.fi.intel.com>
References: <1357986867-22396-1-git-send-email-lists.tormod@gmail.com>
 <1358430969.2731.253.camel@sauron.fi.intel.com>
Date: Thu, 17 Jan 2013 23:58:48 +0100
Message-ID: <CAArsGabYJQseWmJ8Tf6iQju_WvVrNTmKXrLpn8N==5x7LqF-pg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd/nand: Print source of error message
From: Tormod Volden <lists.tormod@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vikram Narayanan <vikram186@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 17, 2013 at 2:56 PM, Artem Bityutskiy wrote:
> On Sat, 2013-01-12 at 11:34 +0100, Tormod Volden wrote:
>> From: Tormod Volden <debian.tormod@gmail.com>
>>
>> Add the function name to the error message.
>>
>> These messages are not very helpful:
>>
>> [183356.176682] uncorrectable error :
>> [183356.180273] uncorrectable error :
>> [183356.184194] uncorrectable error :
>> [183356.187773] uncorrectable error :
>> [183356.191280] uncorrectable error :
>>
>> Signed-off-by: Tormod Volden <debian.tormod@gmail.com>
>
> Pushed to l2-mtd.git with a minor amendment (kill the semicolon at the
> end).

Thanks! I guess the intention of the colon at the end was that the
calling function would fill in more details, but if this does not
happen it is better without. In that case it should even be a \n at
the end though...

Tormod
