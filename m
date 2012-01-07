Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RjMr2-0005t8-NG
 for linux-mtd@lists.infradead.org; Sat, 07 Jan 2012 03:22:01 +0000
Received: by wera10 with SMTP id a10so2156952wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2012 19:21:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1325780040-19809-3-git-send-email-angus.clark@st.com>
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
 <1325780040-19809-3-git-send-email-angus.clark@st.com>
Date: Fri, 6 Jan 2012 19:21:58 -0800
Message-ID: <CAN8TOE_jFjQ9nmFby27zqvbBj3QE2zYY-ZqwB=E1jtsMKoQpSA@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 3/7] nand-data: update READID data for family of
 Micron devices
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
> Update the READID data for the following Micron devices: MT29F4G08ABADA,
> MT29F4G16ABADA, MT29F4G08ABBDA, MT29F4G16ABBDA, MT29F8G08ADBDA, MT29F8G16ADBDA,
> MT29F8G08ADADA, MT29F8G16ADADA. (Problem with the second byte in the Full ID
> column.)

Good catch

Acked-by: Brian Norris <computersforpeace@gmail.com>
