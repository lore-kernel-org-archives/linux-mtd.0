Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RjMv8-000648-DJ
 for linux-mtd@lists.infradead.org; Sat, 07 Jan 2012 03:26:15 +0000
Received: by wibhq15 with SMTP id hq15so2014775wib.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2012 19:26:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1325780040-19809-4-git-send-email-angus.clark@st.com>
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
 <1325780040-19809-4-git-send-email-angus.clark@st.com>
Date: Fri, 6 Jan 2012 19:26:12 -0800
Message-ID: <CAN8TOE-ES67o=y7YfcbjinSxNHUNm=xLAzqvcyDkpUg5VH7Qng@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 4/7] nand-data: update MT29F8G08AB--- device IDs
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
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
> Fix device IDs for Micron MT29F8G08ABABA and MT29F8G08ABCBB, from 0x28 to 0x38,
> and update ONFI version to 2.1, according to dataheet.

Another good catch. I have no idea how this error got in. The correct
info was already in my local version of the table.

Acked-by: Brian Norris <computersforpeace@gmail.com>
