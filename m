Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGq3h-0001Pp-71
 for linux-mtd@lists.infradead.org; Sun, 28 Oct 2018 18:45:10 +0000
Subject: Re: read-only FS with error -2
To: Richard Weinberger <richard@nod.at>
References: <14ebdb35-43e6-47b6-e947-2d9f9cee100b@candelatech.com>
 <1802789.Q3TFOnfEdj@blindfold>
 <80fe0c51-d651-13ac-a985-a0ee6b5d7edd@candelatech.com>
 <12453083.5lVtCAIVAB@blindfold>
Cc: linux-mtd@lists.infradead.org
From: Ben Greear <greearb@candelatech.com>
Message-ID: <0e90fe2a-1747-7a4c-9b6b-576dfdfad86d@candelatech.com>
Date: Sun, 28 Oct 2018 11:44:46 -0700
MIME-Version: 1.0
In-Reply-To: <12453083.5lVtCAIVAB@blindfold>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 10/28/2018 08:21 AM, Richard Weinberger wrote:
> Ben,
>
> Am Sonntag, 28. Oktober 2018, 16:08:13 CET schrieb Ben Greear:
>> That is not an easy thing to do on random embedded systems.  Possibly I could add a kernel
>
> Debugging random non-development systems is never easy.
>
>> command line option...is that supported?
>
> The UBIFS module takes no parameters. But patches are welcome.

I'm fully occupied with the wifi stack issues...hoping other people
can work on different issues.

> For now you can just use your initramfs (AFAIK OpenWRT has one), boot with rdinit=/bin/sh ...
>
> Or apply a hacky patch like this one to enable chk_fs always...

Problem is, when I re-install then the problem goes away.  Would it
be bad to enable this code all the time on production systems?

Could UBIFS just enable debugging and print out any pertinent
info when it detects the failure instead of (just) going into RO
mode?

Thanks,
Ben

>
> diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
> index 64c6977c189b..ea0ffc0a9660 100644
> --- a/fs/ubifs/debug.h
> +++ b/fs/ubifs/debug.h
> @@ -231,7 +231,7 @@ static inline int dbg_is_chk_lprops(const struct ubifs_info *c)
>  }
>  static inline int dbg_is_chk_fs(const struct ubifs_info *c)
>  {
> -	return !!(ubifs_dbg.chk_fs || c->dbg->chk_fs);
> +	return 1;
>  }
>  static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)
>  {
>
> Thanks,
> //richard
>
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com
