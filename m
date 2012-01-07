Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RjMbd-0005Ru-I5
 for linux-mtd@lists.infradead.org; Sat, 07 Jan 2012 03:06:06 +0000
Received: by wera10 with SMTP id a10so2151215wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2012 19:06:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1325780040-19809-1-git-send-email-angus.clark@st.com>
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
Date: Fri, 6 Jan 2012 19:06:01 -0800
Message-ID: <CAN8TOE-7jA_+6hZCvzXR7=MrjuhrUq3LTZBqd5O-9Gy_iiL6Cw@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 1/7] nand-data: updates to S30ML-P devices
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
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

On Thu, Jan 5, 2012 at 8:13 AM, Angus CLARK <angus.clark@st.com> wrote:
> Updates to Spansion S30ML-P devices:
> =A0 =A0 =A0 =A0- expand names to differentiate between x8 and x16 devices
> =A0 =A0 =A0 =A0- fix ID 5th byte: 0x01 to 0x10 (checked with datasheet; s=
eems regression
> =A0 =A0 =A0 =A0 =A0introduced as part of commit 165cfaa9cdb1054bbafa98f24=
f179c6aa101fbe6
> =A0 =A0 =A0 =A0 =A0"nand-data: remove asterisks")
>
> Signed-off-by: Angus Clark <angus.clark@st.com>

Thanks for the follow-up. It should make it a little easier to review
the later ones (that I didn't get around to yet).

Acked-by: Brian Norris <computersforpeace@gmail.com>
