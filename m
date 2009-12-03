Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NGEKc-0006D4-OB
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 16:15:07 +0000
Received: by bwz4 with SMTP id 4so1279662bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Dec 2009 08:14:58 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 3 Dec 2009 17:14:58 +0100
Message-ID: <209499a0912030814n77ebc711o843701d77bed2bf2@mail.gmail.com>
Subject: [Intel Turbo Memory] Can I use Memory Technology Device (MTD) driver
	for turning on my Intel Turbo Memory?
From: palmax@gmail.com
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I have an "Intel Turbo Memory" device (aka Robson),
http://www.intel.com/support/chipsets/itm/index.htm , and I want to
ask you if I could turn it on with your Memory Technology Device (MTD)
driver.

I will attach the info of my Intel Turbo Memory Controller, because it
could help you to give me a good reply :D

Thanks for you help
Palmax

# lspci -s 08:00.0 -vvv
08:00.0 Memory controller: Intel Corporation Turbo Memory Controller (rev 11)
        Subsystem: Intel Corporation Device 4447
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 11
        Region 0: Memory at f2100000 (32-bit, non-prefetchable) [size=1K]
        Region 2: I/O ports at 4000 [size=256]
        [virtual] Expansion ROM at c0000000 [disabled] [size=64K]
        Capabilities: [48] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] Message Signalled Interrupts: Mask- 64bit-
Count=1/1 Enable-
                Address: 00000000  Data: 0000
        Capabilities: [68] Express (v1) Legacy Endpoint, MSI 01
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq-
AuxPwr- TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1,
Latency L0 <512ns, L1 <32us
                        ClockPM- Suprise- LLActRep- BwNot-
                LnkCtl: ASPM L0s L1 Enabled; RCB 128 bytes Disabled-
Retrain- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train-
SlotClk+ DLActive- BWMgmt- ABWMgmt-
