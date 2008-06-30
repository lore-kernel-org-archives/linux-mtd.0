Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KD7sE-0006pn-Js
	for linux-mtd@lists.infradead.org; Mon, 30 Jun 2008 01:08:07 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1269309wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Jun 2008 18:08:04 -0700 (PDT)
Message-ID: <9c9fda240806291808s1c156260jb5794dab9010a004@mail.gmail.com>
Date: Mon, 30 Jun 2008 10:08:04 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: suresh@mistralsolutions.com
Subject: Re: JFFS2 Cleanmarker Issue
In-Reply-To: <20080629100837.4jm8veu1c5s8kos4@webmail.mistralsolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4856F1F7.4040003@mistralsolutions.com>
	<366f00c80806161827q46a5ea2bmc0e51f5c4d6c96ec@mail.gmail.com>
	<48580867.6030403@mistralsolutions.com>
	<366f00c80806290452r6d55feb5w49ab0fb70315a206@mail.gmail.com>
	<20080629100837.4jm8veu1c5s8kos4@webmail.mistralsolutions.com>
Cc: Sudeep K N <sudeepholla.maillist@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Jun 30, 2008 at 12:08 AM,  <suresh@mistralsolutions.com> wrote:
> Hi
>
> Quoting Sudeep K N <sudeepholla.maillist@gmail.com>:
>> No cleanmarker doesnot always start from 1st byte
>> The position of cleanmarker depends on the oobfree area specified by
>> you through
>> struct nand_ecclayout
>>
>> --
>> Regards,
>> Sudeep
>
> I think I found the reason for the issue. I forgot to mention that we
> are using oneNAND. OneNAND uses the fragmented OOB, which I think is
> not supported by Jffs2 and oneNAND driver in 2.6.16-rc3.
>
> Thanks,
> Suresh
>

In the early stage, it doesn't handle not-alinged oob access and use
the MTD_OOB_PLACE.
If you don't need to use 2.6.16-rc3, please use the latest kernel or
later version.
or simple hack, please modify oobfree value from {2, 3} to {2, 4},
{18, 3->4} and so one, but not recommend.

Thank you,
Kyungmin Park
