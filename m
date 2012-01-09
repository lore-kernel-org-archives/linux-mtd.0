Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkL7v-0003CM-6X
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 19:43:28 +0000
Received: by wera10 with SMTP id a10so4069619wer.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 11:43:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1325780040-19809-6-git-send-email-angus.clark@st.com>
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
 <1325780040-19809-6-git-send-email-angus.clark@st.com>
Date: Mon, 9 Jan 2012 11:43:25 -0800
Message-ID: <CAN8TOE800suJxnaYv_ouOfx_zRGwVydBdQy8b_A9iEmrOkiMMw@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 6/7] nand-data: expand Samsung "K9XDG08U5D"
 devices
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
> This patch expands "K9XDG08U5D" to give two separate entries, K9MDG08U5D (Single
> I/F device) and K9PDG08U5D (Dual I/F device).

Looks good. Note that this will need to rebase properly when you
change the fix the "Scan page 1" column so that these parts do not
have `Scan page 1 = TRUE'.

Thanks,
Brian
