Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjDx5-0004pz-1D
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 18:23:55 +0000
Received: by ghbf11 with SMTP id f11so3349838ghb.36
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2012 11:23:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FE88E9A.4040605@xenotime.net>
References: <1340637580-12711-1-git-send-email-aletes.xgr@gmail.com>
 <4FE88E9A.4040605@xenotime.net>
Date: Mon, 25 Jun 2012 15:23:53 -0300
Message-ID: <CAAAP30Gmfw-wLztrb7HUbeWYo5zAac6DOnewOJNPz0zXEy03zQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix build warning
From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
To: Randy Dunlap <rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 25, 2012 at 1:15 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On 06/25/2012 08:19 AM, Alexandre Pereira da Silva wrote:
>
>> Fix:
>> fs/ubifs/dir.c: In function 'ubifs_rename':
>> fs/ubifs/dir.c:972:15: warning: 'saved_nlink' may be used uninitialized
>> in this function
>>
>> Initilize saved_nlink to 0
>
> Does nlink need to be init at all? =A0is the warning bogus or valid?

>From the code, this is a bogus warning.

> If the warning is bogus, the preferred solution is:
>
> #include <linux/compiler-gcc.h>
> ...
> =A0 =A0 =A0 =A0unsigned int uninitialized_var(nlink);

I will fix the patch as suggested. Thanks.
