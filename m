Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpJXl-0007iS-12
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 09:49:11 +0000
Received: by rv-out-0708.google.com with SMTP id l33so481740rvb.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Apr 2009 02:49:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49D47252.3020701@nokia.com>
References: <e8775dd00904012244o30200226p4e748d89d2a9b9c7@mail.gmail.com>
	<49D47252.3020701@nokia.com>
Date: Thu, 2 Apr 2009 17:49:02 +0800
Message-ID: <e8775dd00904020249k6dd1146chfae6e74c11a01f82@mail.gmail.com>
Subject: Re: ubifs error when do bonnie++ test
From: Jason Liu <liu.h.jason@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/4/2 Adrian Hunter <adrian.hunter@nokia.com>:
> Jason Liu wrote:
>>
>> I'm working on the 2.6.26 with ubifs enabled, but after some stress
>> test, ubifs give some err. The following is the steps to reproduce.
>
> Please apply all recent UBIFS patches and enable debugging and try
> again.
>
> You could also enable debugging checks, but that will really slow it down.
>
>
After apply all the patches from users/dedekind/ubifs-v2.6.26.git
I still get errors with bonnie++ test and only run 3times compared 390
times without the patch

Using uid:0, gid:0.
Writing with putc()...done
Writing intelligently...done
Rewriting...done
Reading with getc()...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...done.
Stat files in sequential order...Expected 16384 files but only got 16385
Cleaning up test directory after error.

Could you please help on this?Does this means UBIFS has some bugs?
