Received: from mail-wm0-f66.google.com ([74.125.82.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cW7H1-00017l-S8
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 20:01:01 +0000
Received: by mail-wm0-f66.google.com with SMTP id r126so37195771wmr.3
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jan 2017 12:00:39 -0800 (PST)
Subject: Re: fs/jffs2/readinode.c:189: faulty logic ?
To: David Binderman <dcb314@hotmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <VI1PR08MB1022F25C7F26E465355F07149C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
 <8d72adf5-097f-0c72-edfc-d23d4199e9d4@gmail.com>
 <VI1PR08MB1022B30CF5D9834EC9304F0F9C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <80ef981e-32cc-d40c-0f7f-61b0530e5a28@gmail.com>
Date: Tue, 24 Jan 2017 20:59:35 +0100
MIME-Version: 1.0
In-Reply-To: <VI1PR08MB1022B30CF5D9834EC9304F0F9C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
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

On 01/24/2017 08:17 PM, David Binderman wrote:
> 
> Hello there,
> 
> 
> ________________________________
> 
>> This changes the logic of the code for equality case, please elaborate
>> why this is OK.
> 
> RTFM.
> 
> Linux kernel file Documentation/rbtree.txt, around line 95, has the standard logic
> for traversing a red black tree.

In that case, please RTFM Documentation/process/submitting-patches.rst
and we continue the discussion there :)

-- 
Best regards,
Marek Vasut
