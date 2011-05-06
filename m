Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIU1E-0004Hp-23
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 23:01:08 +0000
Received: by vxd2 with SMTP id 2so4969982vxd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 16:01:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=OnCStkBRnc-qAnzevc0GndrsD9w@mail.gmail.com>
References: <1304694820-32474-1-git-send-email-dedekind1@gmail.com>
	<1304694813.7222.75.camel@localhost>
	<BANLkTi=OnCStkBRnc-qAnzevc0GndrsD9w@mail.gmail.com>
Date: Fri, 6 May 2011 19:01:05 -0400
Message-ID: <BANLkTike5cy+D-iR7K1XyHWBsw7XRdDvLw@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: add the fixup function
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 6, 2011 at 11:23 AM, Matthew L. Creech <mlcreech@gmail.com> wrote:
> On Fri, May 6, 2011 at 11:13 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>>
>> Also, we use "UBIFS:" (capital letters) prefix for patches. Could you
>> please take a look and if you do not have strong disagreements then
>> amend _this_ version of patch, test it and probably fix, and then send
>> the whole series again. Note, patch N1 is already in my tree, so unless
>> you need to change it - you do not have to send it.
>
> Thanks Artem, I'll review & test on a few devices here then re-submit.
>

I tested your version, and it worked fine without modification.  I
pushed out another patchset based on that (hopefully comes through OK,
first time using "git send-email"...)

-- 
Matthew L. Creech
