Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctW3B-0006xE-64
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 09:07:26 +0000
Received: by mail-oi0-x22d.google.com with SMTP id f193so24742596oib.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 02:07:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9c8a5e49-826c-88c3-5186-977f3ec9304c@nod.at>
References: <1490864181-2192-1-git-send-email-richard@nod.at>
 <CAOQ4uxgd5OPg0YzX+PAoDAEiWDVTiScd9hkKvOPqOOGNNBO=+A@mail.gmail.com>
 <9c8a5e49-826c-88c3-5186-977f3ec9304c@nod.at>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 30 Mar 2017 12:07:03 +0300
Message-ID: <CAOQ4uxiv2aKFMcT-=KfA4ucDJW5DaPNWRdF9-wppLrjBx3AFHA@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 "stable [v4.9]" <stable@vger.kernel.org>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 30, 2017 at 12:03 PM, Richard Weinberger <richard@nod.at> wrote:
> Amir,
>
> Am 30.03.2017 um 10:59 schrieb Amir Goldstein:
>> On Thu, Mar 30, 2017 at 11:56 AM, Richard Weinberger <richard@nod.at> wrote:
>>> It is perfectly fine to link a tmpfile back using linkat().
>>> Since tmpfiles are created with a link count of 0 they appear
>>> on the orphan list, upon re-linking the inode has to be removed
>>> from the orphan list again.
>>>
>>
>> Looks good.
>>
>>> Cc: <stable@vger.kernel.org>
>>> Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>
>>> Cc: Amir Goldstein <amir73il@gmail.com
>>
>> typo: missing closing >
>
> Whoops, copied one byte too few from Thunderbird. :D
> Will fix before pushing.
>


It's worth mentioning the bug that Ralph reported.
The fact that overlayfs mount in v4.11-rc causes corruption of ubifs is much
more severe than what the current commit message implies (fix of a corner case).

I would also add # v4.9 hint to stable tag, just to be nice ;-)
