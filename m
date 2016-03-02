Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abEGf-0000JA-O6
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 21:25:14 +0000
Subject: Re: [PATCH V2] ubifs: Add logging functions for ubifs_msg, ubifs_err
 and ubifs_warn
To: Joe Perches <joe@perches.com>
References: <1456944509.4044.27.camel@nod.at>
 <1456945122.4044.35.camel@perches.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56D75A1F.5070304@nod.at>
Date: Wed, 2 Mar 2016 22:24:47 +0100
MIME-Version: 1.0
In-Reply-To: <1456945122.4044.35.camel@perches.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joe,

Am 02.03.2016 um 19:58 schrieb Joe Perches:
> On Wed, 2016-03-02 at 19:46 +0100, Richard Weinberger wrote:
>> Am 02.03.2016 7:19 nachm. schrieb Joe Perches <joe@perches.com>:
>>> On Tue, 2016-02-23 at 12:21 -0800, Joe Perches wrote:
>>>> The existing logging macros are fairly large and converting the 
>>>> macros to functions make the object code smaller. 
>>> Artem and Adrian are the nominal maintainers for ubifs. 
>>>
>>> Artem last had a sign-off on a ubifs patch 6 months ago and 
>>> Adrian's last one was over 3 years ago. 
>>>
>>> Is there an expected ack/nack/applied handling time for a 
>>> ubifs patch like this? 
>>>
>>> Should this patch go to someone else? 
>>>
>>> Should the MAINTAINERS entry for ubifs be changed to orphan? 
>> No need to panic. I take care of the patch. :)
> 
> No worries, I'm calm.  But if you're taking care of the patch
> and not the nominal maintainers, likely the MAINTAINERS entry
> should be updated.
> 
> Presumably the equivalent ubi patch will be handled in the
> same fashion,
> 
> For drivers/mtd/ubi, Artem is also a nominal maintainer, but
> last signed a patch in 2014.
> 
> Likely the MAINTAINERS entry for UBI should be updated too.
> 
> Maybe something like:
> ---
>  MAINTAINERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81302e4..927557c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11266,8 +11266,7 @@ S:	Maintained
>  F:	drivers/scsi/u14-34f.c
>  
>  UBI FILE SYSTEM (UBIFS)
> -M:	Artem Bityutskiy <dedekind1@gmail.com>
> -M:	Adrian Hunter <adrian.hunter@intel.com>
> +M:	Richard Weinberger <richard@nod.at>

I can be the official patch monkey for UBIFS.
Especial as the git tree is the same as for UBI.

But I definitely want to keep Artem.
He gives very valuable input and knows UBIFS much better than I do.

>  L:	linux-mtd@lists.infradead.org
>  T:	git git://git.infradead.org/ubifs-2.6.git
>  W:	http://www.linux-mtd.infradead.org/doc/ubifs.html
> @@ -11350,7 +11349,6 @@ F:	Documentation/scsi/ufs.txt
>  F:	drivers/scsi/ufs/
>  
>  UNSORTED BLOCK IMAGES (UBI)
> -M:	Artem Bityutskiy <dedekind1@gmail.com>
>  M:	Richard Weinberger <richard@nod.at>
>  W:	http://www.linux-mtd.infradead.org/
>  L:	linux-mtd@lists.infradead.org

Same here. Artem has to stay.

Thanks,
//richard
