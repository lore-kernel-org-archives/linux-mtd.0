Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWIzy-0002Po-NO
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 08:32:13 +0000
Subject: Re: fs/jffs2/readinode.c:189: faulty logic ?
To: David Binderman <dcb314@hotmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <VI1PR08MB1022F25C7F26E465355F07149C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
 <CAFLxGvwJrLR8-5QSfzL3TBk_kwLSUq+DarCB5XWbn+LKiK53dQ@mail.gmail.com>
 <VI1PR08MB1022FF07BD9A4B08984561FE9C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <418e1f6c-3234-89b3-423c-023e00b63d32@nod.at>
Date: Wed, 25 Jan 2017 09:31:40 +0100
MIME-Version: 1.0
In-Reply-To: <VI1PR08MB1022FF07BD9A4B08984561FE9C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
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

David,

Am 24.01.2017 um 23:57 schrieb David Binderman:
>>> fs/jffs2/readinode.c:189]: (style) Condition 'tn.fn.ofs>=offset' is always true
> 
>>What tool produces this info?
> 
> A static analyser for C and C++ called cppcheck, available from sourceforge.

That needs to go into the changelog.

>>That code is odd, yes. But we need more info.
>>Why is fn.fn.ofs>=offset always true?
> 
> Doh. By obvious inspection of the code.
> If test x < y fails, then x must be >= y.

So tn.fn.ofs>=offset is _not_ always true.
The else branch is always false.

Thanks,
//richard
