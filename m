Received: from mail-lf0-f66.google.com ([209.85.215.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cW2Tm-0002gJ-Le
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 14:53:52 +0000
Received: by mail-lf0-f66.google.com with SMTP id q89so17711959lfi.1
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jan 2017 06:53:29 -0800 (PST)
Subject: Re: fs/jffs2/readinode.c:189: faulty logic ?
To: David Binderman <dcb314@hotmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <VI1PR08MB1022F25C7F26E465355F07149C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8d72adf5-097f-0c72-edfc-d23d4199e9d4@gmail.com>
Date: Tue, 24 Jan 2017 15:52:25 +0100
MIME-Version: 1.0
In-Reply-To: <VI1PR08MB1022F25C7F26E465355F07149C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
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

On 01/24/2017 09:15 AM, David Binderman wrote:
> Hello there,
> 
> fs/jffs2/readinode.c:189]: (style) Condition 'tn.fn.ofs>=offset' is always true
> 
> Source code is
> 
>         if (tn->fn->ofs < offset)
>             next = tn->rb.rb_right;
>         else if (tn->fn->ofs >= offset)
>             next = tn->rb.rb_left;
>         else
>             break;
> 
> Maybe better code
> 
>         if (tn->fn->ofs < offset)
>             next = tn->rb.rb_right;
>         else if (tn->fn->ofs > offset)
>             next = tn->rb.rb_left;
>         else
>             break;

This changes the logic of the code for equality case, please elaborate
why this is OK.

> Regards
> 
> David Binderman
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


-- 
Best regards,
Marek Vasut
