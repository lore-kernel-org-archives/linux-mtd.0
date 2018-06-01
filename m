Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOfQh-0005LS-0v
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2018 08:29:00 +0000
Received: by mail-wm0-x242.google.com with SMTP id q4-v6so5580989wmq.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Jun 2018 01:28:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAR3sxP_JEXoA6JMN6FgDp8p1PsmDG9JONJXEbz-APZoOjrKBA@mail.gmail.com>
References: <CAAR3sxP_JEXoA6JMN6FgDp8p1PsmDG9JONJXEbz-APZoOjrKBA@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 1 Jun 2018 10:28:46 +0200
Message-ID: <CAFLxGvxBF1hrr8dh5xfH3WMj3ND64OftOv_OvPjjdXYE9iBXsA@mail.gmail.com>
Subject: Re: UBIFS node corruption issue
To: "Sourabh Jain (R&D - Telecom)" <sourabh.jain@matrixcomsec.com>
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

Sourabh Jain,

On Fri, Jun 1, 2018 at 6:25 AM, Sourabh Jain (R&D - Telecom)
<sourabh.jain@matrixcomsec.com> wrote:
> Hi all,
>
>
> We are using 3.2.54 Linux kernel. In this, we are facing one issue

Please note that this kernel is very old.
At least run a recent 3.2 stable kernel.

> related to ubifs node  corruption. Below is the core dump captured in
> dmesg output. Due to this node corruption, the application having pid
> 1374 is not able to run.
>
>
> This is not resolved even after reboot. It is generated every time the
> system starts.
>
>
> What can be the problem?

Well, UBIFS' index tree seems to reference a LEB (or part of a LEB)
which is empty.
This can have tons of reasons. Starting from MTD drivers bugs to UBIFS bugs.

> How we can resolve this issue?
>
> Please suggest us necessary action to be taken. Also, please inform us
> if any further input is required from us.

Are you facing this problem on more than one target, and is it reproducible?

-- 
Thanks,
//richard
