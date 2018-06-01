Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOj5S-0001u5-LL
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2018 12:25:04 +0000
Received: by mail-wm0-x244.google.com with SMTP id z6-v6so5168654wma.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Jun 2018 05:23:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxBF1hrr8dh5xfH3WMj3ND64OftOv_OvPjjdXYE9iBXsA@mail.gmail.com>
References: <CAAR3sxP_JEXoA6JMN6FgDp8p1PsmDG9JONJXEbz-APZoOjrKBA@mail.gmail.com>
 <CAFLxGvxBF1hrr8dh5xfH3WMj3ND64OftOv_OvPjjdXYE9iBXsA@mail.gmail.com>
From: "Sourabh Jain (R&D - Telecom)" <sourabh.jain@matrixcomsec.com>
Date: Fri, 1 Jun 2018 17:53:05 +0530
Message-ID: <CAAR3sxPDomY9SzdUt=FAJsaMFUqJMpDviNc4dFbz4WZaX8f8oQ@mail.gmail.com>
Subject: Re: UBIFS node corruption issue
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 "Vamsi S (R&D - Telecom)" <vamsi.s@matrixcomsec.com>,
 "Rajdeep Vaghasia (Software Development - Telecom)"
 <rajdeep.vaghasia@matrixcomsec.com>,
 "Shailesh Panchal (Software Development - Telecom)"
 <shailesh.panchal@matrixcomsec.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Fri, Jun 1, 2018 at 1:58 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> Sourabh Jain,
>
> On Fri, Jun 1, 2018 at 6:25 AM, Sourabh Jain (R&D - Telecom)
> <sourabh.jain@matrixcomsec.com> wrote:
>> Hi all,
>>
>>
>> We are using 3.2.54 Linux kernel. In this, we are facing one issue
>
> Please note that this kernel is very old.
> At least run a recent 3.2 stable kernel.
>
>> related to ubifs node  corruption. Below is the core dump captured in
>> dmesg output. Due to this node corruption, the application having pid
>> 1374 is not able to run.
>>
>>
>> This is not resolved even after reboot. It is generated every time the
>> system starts.
>>
>>
>> What can be the problem?
>
> Well, UBIFS' index tree seems to reference a LEB (or part of a LEB)
> which is empty.
> This can have tons of reasons. Starting from MTD drivers bugs to UBIFS bugs.

There is one observation, i have read all the VID header from the PEB
and there is
no header having LEB number 328, which causing problem.
Why there is mapping for LEB Number 328 in index tree?


>> How we can resolve this issue?
>>
>> Please suggest us necessary action to be taken. Also, please inform us
>> if any further input is required from us.
>
> Are you facing this problem on more than one target, and is it reproducible?

We are facing this problem in some boards.
there is another problem in which the root file system become read
only but actually it is r/w.

Regards,
Sourabh Jain
