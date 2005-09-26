Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJozM-0005AJ-GV
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 05:09:40 -0400
Message-ID: <4337BAAB.7070704@yandex.ru>
Date: Mon, 26 Sep 2005 13:08:59 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F17EC8A97636E63E12669C5E88B0@phx.gbl>
In-Reply-To: <BAY17-F17EC8A97636E63E12669C5E88B0@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Erase block header(revision 1)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
> I agree that version field is not used in my patch after compat_fset,
> incompat_fset and rocompat_fset are introduced in my patch.
> But I'm not sure if we should keep this field. Artem,
> What's your opinion about this?

Well, expect that EBH format may be changed in future, for example if
some Mr.Smith will and one more per-eraseblock field. The same may in
principle happen with any other node type. In this case, we may use the
'version' filed as the FS format identifier. So, IMO, the field is not
useless.

>> > +    uint8_t  compat_fset;
>> > +    uint8_t  incompat_fset;
>> > +    uint8_t  rocompat_fset;
>> > +    jint32_t erase_count; /* the erase count of this erase block */
>> > +    jint16_t dsize; /* the size of additional data behind node_crc */

I still not really like the data[] field. At least the name... Is it
just for future EBH extentions?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
