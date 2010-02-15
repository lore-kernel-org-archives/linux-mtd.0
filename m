Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh1eu-0006tQ-VZ
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 14:10:52 +0000
Received: by ewy23 with SMTP id 23so438856ewy.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Feb 2010 06:10:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <dbdb2ea61002090702y41bfa719k73c4b2c5125d3be3@mail.gmail.com>
References: <dbdb2ea61002090633h770779a5gfa640a3fd6112c22@mail.gmail.com>
	<1265726904.2006.157.camel@localhost>
	<dbdb2ea61002090702y41bfa719k73c4b2c5125d3be3@mail.gmail.com>
Date: Mon, 15 Feb 2010 09:10:42 -0500
Message-ID: <dbdb2ea61002150610w1d2eb87dh406a54cfa57ebba7@mail.gmail.com>
Subject: Re: noatime and nodiratime for ubifs mounting
From: twebb <taliaferro62@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>> To minimize unnecessary writes to UBIFS, does it make sense to mount
>>> with the noatime and nodiratime flags? =A0Some information I've read
>>> suggests that this helps minimize writes and is beneficial to
>>> flash-based filesystems. =A0Is there any downside to using these flags?
>>
>> UBIFS does not support atime anyway:
>>
>> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_atime
>>
>
> Thanks. =A0Sorry, I hadn't seen that specific question.
>
> Does that mean UBIFS also doesn't support 'diratime'?
>

Sorry to ask again, but does no "atime" support mean no "diratime"
either for UBIFS?
