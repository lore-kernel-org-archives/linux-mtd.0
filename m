Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RjMkC-0005fb-Ut
 for linux-mtd@lists.infradead.org; Sat, 07 Jan 2012 03:14:57 +0000
Received: by wgbdt13 with SMTP id dt13so18452wgb.18
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2012 19:14:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1325780040-19809-2-git-send-email-angus.clark@st.com>
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
 <1325780040-19809-2-git-send-email-angus.clark@st.com>
Date: Fri, 6 Jan 2012 19:14:55 -0800
Message-ID: <CAN8TOE8L0qtVVe7Bpn=hGrJdSAqB4C+WGAfNW70bEL_2p0jKmA@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 2/7] nand-data: rename duplicate Numonyx NAND01G
 devices as 'Rev C'
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
> The table includes two entries for each of the following Numonyx devices:
> NAND01GR3B2B, NAND01GW3B2B, NAND01GR4B2B, NAND01GW4B2B. =A0After further =
analysis,
> it seems that the data for the second set of entries actaully coresponds =
to the
> 'Rev C' version of the devices, rather than 'Rev B' as suggested by the n=
ames.
> This patch renames the second set of entries with the 'Rev C' names.

Thanks for working through the mistakes (typos in datasheets and/or
typos by me). This looks good.

Acked-by: Brian Norris <computersforpeace@gmail.com>
